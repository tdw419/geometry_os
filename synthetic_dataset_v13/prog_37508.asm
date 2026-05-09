; DESCRIPTION: Places a magenta line segment connecting (8, 23) to (12, 103).
; PLAN: r0=8(x1), r1=23(y1), r2=12(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 23
LDI r2, 12
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
