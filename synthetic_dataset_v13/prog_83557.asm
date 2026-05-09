; DESCRIPTION: Draws a magenta line from (183, 91) to (98, 169).
; PLAN: r0=183(x1), r1=91(y1), r2=98(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 91
LDI r2, 98
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
