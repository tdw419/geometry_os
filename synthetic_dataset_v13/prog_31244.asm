; DESCRIPTION: Places a white line segment connecting (490, 149) to (158, 42).
; PLAN: r0=490(x1), r1=149(y1), r2=158(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 149
LDI r2, 158
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
