; DESCRIPTION: Renders a magenta line between points (447, 217) and (166, 162).
; PLAN: r0=447(x1), r1=217(y1), r2=166(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 217
LDI r2, 166
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
