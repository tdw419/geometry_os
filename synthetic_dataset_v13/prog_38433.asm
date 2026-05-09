; DESCRIPTION: Places a blue line segment connecting (204, 5) to (507, 170).
; PLAN: r0=204(x1), r1=5(y1), r2=507(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 5
LDI r2, 507
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
