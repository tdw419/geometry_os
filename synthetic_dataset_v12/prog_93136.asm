; DESCRIPTION: Draws a yellow line from (414, 205) to (267, 89).
; PLAN: r0=414(x1), r1=205(y1), r2=267(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 205
LDI r2, 267
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
