; DESCRIPTION: Draws a purple line from (350, 50) to (310, 92).
; PLAN: r0=350(x1), r1=50(y1), r2=310(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 50
LDI r2, 310
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
