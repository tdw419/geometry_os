; DESCRIPTION: Draws a magenta line from (27, 11) to (414, 85).
; PLAN: r0=27(x1), r1=11(y1), r2=414(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 11
LDI r2, 414
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
