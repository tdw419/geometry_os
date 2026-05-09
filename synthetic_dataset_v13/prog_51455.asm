; DESCRIPTION: Draws a blue line from (205, 19) to (26, 200).
; PLAN: r0=205(x1), r1=19(y1), r2=26(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 19
LDI r2, 26
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
