; DESCRIPTION: Renders a magenta line between points (137, 23) and (509, 88).
; PLAN: r0=137(x1), r1=23(y1), r2=509(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 23
LDI r2, 509
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
