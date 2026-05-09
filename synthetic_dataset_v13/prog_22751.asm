; DESCRIPTION: Renders a magenta line between points (249, 193) and (17, 205).
; PLAN: r0=249(x1), r1=193(y1), r2=17(x2), r3=205(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 193
LDI r2, 17
LDI r3, 205
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
