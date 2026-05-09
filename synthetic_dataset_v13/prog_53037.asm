; DESCRIPTION: Places a magenta line segment connecting (381, 207) to (35, 93).
; PLAN: r0=381(x1), r1=207(y1), r2=35(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 207
LDI r2, 35
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
