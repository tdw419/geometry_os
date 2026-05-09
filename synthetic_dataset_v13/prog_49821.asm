; DESCRIPTION: Renders a purple line between points (88, 2) and (402, 113).
; PLAN: r0=88(x1), r1=2(y1), r2=402(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 2
LDI r2, 402
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
