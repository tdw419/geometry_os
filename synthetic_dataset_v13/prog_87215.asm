; DESCRIPTION: Places a magenta line segment connecting (490, 159) to (346, 0).
; PLAN: r0=490(x1), r1=159(y1), r2=346(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 159
LDI r2, 346
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
