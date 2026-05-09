; DESCRIPTION: Places a yellow line segment connecting (297, 11) to (507, 228).
; PLAN: r0=297(x1), r1=11(y1), r2=507(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 11
LDI r2, 507
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
