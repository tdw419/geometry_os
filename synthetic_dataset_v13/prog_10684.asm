; DESCRIPTION: Places a white line segment connecting (253, 68) to (478, 237).
; PLAN: r0=253(x1), r1=68(y1), r2=478(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 68
LDI r2, 478
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
