; DESCRIPTION: Renders a magenta line between points (155, 205) and (463, 209).
; PLAN: r0=155(x1), r1=205(y1), r2=463(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 205
LDI r2, 463
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
