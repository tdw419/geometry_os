; DESCRIPTION: Places a magenta line segment connecting (329, 42) to (54, 131).
; PLAN: r0=329(x1), r1=42(y1), r2=54(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 42
LDI r2, 54
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
