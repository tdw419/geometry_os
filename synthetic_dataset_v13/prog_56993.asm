; DESCRIPTION: Draws a purple line from (254, 5) to (350, 88).
; PLAN: r0=254(x1), r1=5(y1), r2=350(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 5
LDI r2, 350
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
