; DESCRIPTION: Places a magenta line segment connecting (232, 57) to (194, 27).
; PLAN: r0=232(x1), r1=57(y1), r2=194(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 57
LDI r2, 194
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
