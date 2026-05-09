; DESCRIPTION: Places a magenta line segment connecting (248, 60) to (30, 155).
; PLAN: r0=248(x1), r1=60(y1), r2=30(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 60
LDI r2, 30
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
