; DESCRIPTION: Places a white line segment connecting (253, 200) to (109, 43).
; PLAN: r0=253(x1), r1=200(y1), r2=109(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 200
LDI r2, 109
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
