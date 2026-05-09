; DESCRIPTION: Places a black line segment connecting (114, 112) to (240, 41).
; PLAN: r0=114(x1), r1=112(y1), r2=240(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 112
LDI r2, 240
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
