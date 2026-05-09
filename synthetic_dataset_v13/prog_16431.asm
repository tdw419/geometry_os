; DESCRIPTION: Places a magenta line segment connecting (260, 87) to (355, 42).
; PLAN: r0=260(x1), r1=87(y1), r2=355(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 87
LDI r2, 355
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
