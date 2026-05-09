; DESCRIPTION: Renders a magenta line between points (68, 189) and (373, 108).
; PLAN: r0=68(x1), r1=189(y1), r2=373(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 189
LDI r2, 373
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
