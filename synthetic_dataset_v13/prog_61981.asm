; DESCRIPTION: Places a magenta line segment connecting (305, 3) to (496, 226).
; PLAN: r0=305(x1), r1=3(y1), r2=496(x2), r3=226(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 3
LDI r2, 496
LDI r3, 226
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
