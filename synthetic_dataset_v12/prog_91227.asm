; DESCRIPTION: Places a black line segment connecting (253, 130) to (233, 68).
; PLAN: r0=253(x1), r1=130(y1), r2=233(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 130
LDI r2, 233
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
