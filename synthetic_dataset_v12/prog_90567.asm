; DESCRIPTION: Draws a magenta line from (268, 92) to (114, 98).
; PLAN: r0=268(x1), r1=92(y1), r2=114(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 92
LDI r2, 114
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
