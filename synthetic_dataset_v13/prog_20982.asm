; DESCRIPTION: Places a green line segment connecting (327, 90) to (61, 88).
; PLAN: r0=327(x1), r1=90(y1), r2=61(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 90
LDI r2, 61
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
