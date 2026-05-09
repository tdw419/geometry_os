; DESCRIPTION: Draws a magenta line from (189, 241) to (88, 24).
; PLAN: r0=189(x1), r1=241(y1), r2=88(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 241
LDI r2, 88
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
