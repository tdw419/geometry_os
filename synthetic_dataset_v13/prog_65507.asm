; DESCRIPTION: Draws a magenta line from (172, 46) to (276, 78).
; PLAN: r0=172(x1), r1=46(y1), r2=276(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 46
LDI r2, 276
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
