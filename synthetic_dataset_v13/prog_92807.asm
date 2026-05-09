; DESCRIPTION: Draws a magenta line from (447, 149) to (373, 81).
; PLAN: r0=447(x1), r1=149(y1), r2=373(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 149
LDI r2, 373
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
