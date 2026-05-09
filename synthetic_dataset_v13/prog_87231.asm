; DESCRIPTION: Renders a magenta line between points (116, 136) and (363, 72).
; PLAN: r0=116(x1), r1=136(y1), r2=363(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 136
LDI r2, 363
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
