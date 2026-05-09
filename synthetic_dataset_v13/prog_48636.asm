; DESCRIPTION: Places a yellow line segment connecting (152, 55) to (507, 60).
; PLAN: r0=152(x1), r1=55(y1), r2=507(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 55
LDI r2, 507
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
