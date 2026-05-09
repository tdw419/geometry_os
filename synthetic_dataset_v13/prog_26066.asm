; DESCRIPTION: Renders a magenta line between points (175, 53) and (332, 158).
; PLAN: r0=175(x1), r1=53(y1), r2=332(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 53
LDI r2, 332
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
