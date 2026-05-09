; DESCRIPTION: Places a green line segment connecting (507, 166) to (334, 74).
; PLAN: r0=507(x1), r1=166(y1), r2=334(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 166
LDI r2, 334
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
