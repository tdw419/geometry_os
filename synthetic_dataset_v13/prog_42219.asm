; DESCRIPTION: Renders a magenta line between points (461, 91) and (263, 58).
; PLAN: r0=461(x1), r1=91(y1), r2=263(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 91
LDI r2, 263
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
