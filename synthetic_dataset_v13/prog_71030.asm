; DESCRIPTION: Places a magenta line segment connecting (189, 81) to (424, 226).
; PLAN: r0=189(x1), r1=81(y1), r2=424(x2), r3=226(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 81
LDI r2, 424
LDI r3, 226
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
