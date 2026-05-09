; DESCRIPTION: Places a magenta line segment connecting (150, 103) to (134, 103).
; PLAN: r0=150(x1), r1=103(y1), r2=134(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 103
LDI r2, 134
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
