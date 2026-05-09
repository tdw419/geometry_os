; DESCRIPTION: Places a green line segment connecting (507, 158) to (190, 143).
; PLAN: r0=507(x1), r1=158(y1), r2=190(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 158
LDI r2, 190
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
