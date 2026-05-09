; DESCRIPTION: Draws a magenta line from (434, 156) to (65, 97).
; PLAN: r0=434(x1), r1=156(y1), r2=65(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 156
LDI r2, 65
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
