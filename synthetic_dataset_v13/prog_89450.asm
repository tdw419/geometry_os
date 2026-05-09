; DESCRIPTION: Places a green line segment connecting (360, 0) to (120, 88).
; PLAN: r0=360(x1), r1=0(y1), r2=120(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 0
LDI r2, 120
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
