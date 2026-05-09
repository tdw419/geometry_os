; DESCRIPTION: Places a magenta line segment connecting (215, 5) to (342, 201).
; PLAN: r0=215(x1), r1=5(y1), r2=342(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 5
LDI r2, 342
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
