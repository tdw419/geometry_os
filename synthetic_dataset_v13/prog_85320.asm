; DESCRIPTION: Places a yellow line segment connecting (375, 169) to (443, 179).
; PLAN: r0=375(x1), r1=169(y1), r2=443(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 169
LDI r2, 443
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
