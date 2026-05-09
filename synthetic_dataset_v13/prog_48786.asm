; DESCRIPTION: Places a yellow line segment connecting (463, 20) to (18, 24).
; PLAN: r0=463(x1), r1=20(y1), r2=18(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 20
LDI r2, 18
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
