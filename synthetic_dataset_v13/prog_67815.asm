; DESCRIPTION: Draws a magenta line from (350, 240) to (343, 109).
; PLAN: r0=350(x1), r1=240(y1), r2=343(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 240
LDI r2, 343
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
