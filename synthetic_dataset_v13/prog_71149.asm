; DESCRIPTION: Places a black line segment connecting (191, 88) to (217, 133).
; PLAN: r0=191(x1), r1=88(y1), r2=217(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 88
LDI r2, 217
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
