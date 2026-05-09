; DESCRIPTION: Places a magenta line segment connecting (267, 10) to (400, 30).
; PLAN: r0=267(x1), r1=10(y1), r2=400(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 10
LDI r2, 400
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
