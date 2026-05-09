; DESCRIPTION: Places a purple line segment connecting (298, 88) to (266, 196).
; PLAN: r0=298(x1), r1=88(y1), r2=266(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 88
LDI r2, 266
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
