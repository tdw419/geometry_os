; DESCRIPTION: Renders a magenta line between points (151, 215) and (318, 189).
; PLAN: r0=151(x1), r1=215(y1), r2=318(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 215
LDI r2, 318
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
