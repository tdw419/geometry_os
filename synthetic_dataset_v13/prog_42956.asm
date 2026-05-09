; DESCRIPTION: Places a green line segment connecting (240, 120) to (507, 89).
; PLAN: r0=240(x1), r1=120(y1), r2=507(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 120
LDI r2, 507
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
