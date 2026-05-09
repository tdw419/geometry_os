; DESCRIPTION: Places a green line segment connecting (74, 175) to (150, 158).
; PLAN: r0=74(x1), r1=175(y1), r2=150(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 175
LDI r2, 150
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
