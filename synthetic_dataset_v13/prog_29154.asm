; DESCRIPTION: Places a white line segment connecting (86, 88) to (167, 61).
; PLAN: r0=86(x1), r1=88(y1), r2=167(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 88
LDI r2, 167
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
