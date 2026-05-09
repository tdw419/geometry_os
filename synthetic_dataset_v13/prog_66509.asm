; DESCRIPTION: Places a red line segment connecting (443, 88) to (264, 179).
; PLAN: r0=443(x1), r1=88(y1), r2=264(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 88
LDI r2, 264
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
