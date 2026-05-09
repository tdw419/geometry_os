; DESCRIPTION: Renders a magenta line between points (424, 44) and (183, 252).
; PLAN: r0=424(x1), r1=44(y1), r2=183(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 44
LDI r2, 183
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
