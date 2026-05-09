; DESCRIPTION: Draws a cyan line from (30, 186) to (59, 243).
; PLAN: r0=30(x1), r1=186(y1), r2=59(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 186
LDI r2, 59
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
