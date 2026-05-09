; DESCRIPTION: Renders a magenta line between points (500, 156) and (161, 12).
; PLAN: r0=500(x1), r1=156(y1), r2=161(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 156
LDI r2, 161
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
