; DESCRIPTION: Renders a magenta line between points (329, 71) and (282, 191).
; PLAN: r0=329(x1), r1=71(y1), r2=282(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 71
LDI r2, 282
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
