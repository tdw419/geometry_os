; DESCRIPTION: Draws a cyan line from (388, 193) to (59, 250).
; PLAN: r0=388(x1), r1=193(y1), r2=59(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 193
LDI r2, 59
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
