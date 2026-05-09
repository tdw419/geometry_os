; DESCRIPTION: Places a red line segment connecting (507, 53) to (360, 103).
; PLAN: r0=507(x1), r1=53(y1), r2=360(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 53
LDI r2, 360
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
