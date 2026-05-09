; DESCRIPTION: Draws a cyan line from (225, 108) to (484, 247).
; PLAN: r0=225(x1), r1=108(y1), r2=484(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 108
LDI r2, 484
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
