; DESCRIPTION: Places a purple line segment connecting (92, 18) to (270, 50).
; PLAN: r0=92(x1), r1=18(y1), r2=270(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 18
LDI r2, 270
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
