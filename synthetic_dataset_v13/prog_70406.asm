; DESCRIPTION: Places a blue line segment connecting (507, 82) to (457, 172).
; PLAN: r0=507(x1), r1=82(y1), r2=457(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 82
LDI r2, 457
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
