; DESCRIPTION: Places a white line segment connecting (411, 216) to (507, 228).
; PLAN: r0=411(x1), r1=216(y1), r2=507(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 216
LDI r2, 507
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
