; DESCRIPTION: Draws a blue line from (6, 126) to (232, 205).
; PLAN: r0=6(x1), r1=126(y1), r2=232(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 126
LDI r2, 232
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
