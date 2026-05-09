; DESCRIPTION: Places a black line segment connecting (500, 25) to (245, 114).
; PLAN: r0=500(x1), r1=25(y1), r2=245(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 25
LDI r2, 245
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
