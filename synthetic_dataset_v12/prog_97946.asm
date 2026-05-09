; DESCRIPTION: Draws a magenta line from (194, 46) to (132, 56).
; PLAN: r0=194(x1), r1=46(y1), r2=132(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 46
LDI r2, 132
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
