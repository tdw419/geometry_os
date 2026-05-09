; DESCRIPTION: Places a black line segment connecting (492, 130) to (288, 121).
; PLAN: r0=492(x1), r1=130(y1), r2=288(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 130
LDI r2, 288
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
