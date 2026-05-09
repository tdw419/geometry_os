; DESCRIPTION: Places a black line segment connecting (76, 154) to (507, 185).
; PLAN: r0=76(x1), r1=154(y1), r2=507(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 154
LDI r2, 507
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
