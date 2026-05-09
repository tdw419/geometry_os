; DESCRIPTION: Renders a magenta line between points (183, 232) and (353, 126).
; PLAN: r0=183(x1), r1=232(y1), r2=353(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 232
LDI r2, 353
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
