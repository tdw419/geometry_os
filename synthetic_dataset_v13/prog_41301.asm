; DESCRIPTION: Draws a magenta line from (114, 92) to (195, 40).
; PLAN: r0=114(x1), r1=92(y1), r2=195(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 92
LDI r2, 195
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
