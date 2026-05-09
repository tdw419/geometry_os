; DESCRIPTION: Places a black line segment connecting (22, 171) to (507, 0).
; PLAN: r0=22(x1), r1=171(y1), r2=507(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 171
LDI r2, 507
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
