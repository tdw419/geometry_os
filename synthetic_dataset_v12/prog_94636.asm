; DESCRIPTION: Places a black line segment connecting (109, 140) to (194, 210).
; PLAN: r0=109(x1), r1=140(y1), r2=194(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 140
LDI r2, 194
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
