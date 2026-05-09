; DESCRIPTION: Draws a magenta line from (11, 154) to (122, 122).
; PLAN: r0=11(x1), r1=154(y1), r2=122(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 154
LDI r2, 122
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
