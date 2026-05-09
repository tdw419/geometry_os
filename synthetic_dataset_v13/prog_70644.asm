; DESCRIPTION: Places a yellow line segment connecting (498, 130) to (41, 75).
; PLAN: r0=498(x1), r1=130(y1), r2=41(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 130
LDI r2, 41
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
