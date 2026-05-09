; DESCRIPTION: Places a green line segment connecting (507, 26) to (74, 103).
; PLAN: r0=507(x1), r1=26(y1), r2=74(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 26
LDI r2, 74
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
