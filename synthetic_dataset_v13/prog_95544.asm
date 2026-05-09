; DESCRIPTION: Places a magenta line segment connecting (6, 22) to (423, 42).
; PLAN: r0=6(x1), r1=22(y1), r2=423(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 22
LDI r2, 423
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
