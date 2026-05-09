; DESCRIPTION: Places a magenta line segment connecting (95, 230) to (496, 12).
; PLAN: r0=95(x1), r1=230(y1), r2=496(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 230
LDI r2, 496
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
