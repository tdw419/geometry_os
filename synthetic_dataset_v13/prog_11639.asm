; DESCRIPTION: Draws a magenta line from (6, 86) to (45, 56).
; PLAN: r0=6(x1), r1=86(y1), r2=45(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 86
LDI r2, 45
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
