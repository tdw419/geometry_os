; DESCRIPTION: Renders a magenta line between points (303, 88) and (421, 25).
; PLAN: r0=303(x1), r1=88(y1), r2=421(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 88
LDI r2, 421
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
