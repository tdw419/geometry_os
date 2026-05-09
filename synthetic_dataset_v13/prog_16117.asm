; DESCRIPTION: Renders a magenta line between points (198, 224) and (155, 162).
; PLAN: r0=198(x1), r1=224(y1), r2=155(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 224
LDI r2, 155
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
