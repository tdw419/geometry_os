; DESCRIPTION: Renders a magenta line between points (407, 23) and (130, 133).
; PLAN: r0=407(x1), r1=23(y1), r2=130(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 23
LDI r2, 130
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
