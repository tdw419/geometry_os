; DESCRIPTION: Places a magenta line segment connecting (256, 6) to (25, 42).
; PLAN: r0=256(x1), r1=6(y1), r2=25(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 6
LDI r2, 25
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
