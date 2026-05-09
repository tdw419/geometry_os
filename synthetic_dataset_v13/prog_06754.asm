; DESCRIPTION: Draws a blue line from (265, 15) to (416, 205).
; PLAN: r0=265(x1), r1=15(y1), r2=416(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 15
LDI r2, 416
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
