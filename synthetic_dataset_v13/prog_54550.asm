; DESCRIPTION: Draws a black line from (334, 130) to (100, 72).
; PLAN: r0=334(x1), r1=130(y1), r2=100(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 130
LDI r2, 100
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
