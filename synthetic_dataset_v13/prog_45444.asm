; DESCRIPTION: Renders a magenta line between points (208, 56) and (341, 226).
; PLAN: r0=208(x1), r1=56(y1), r2=341(x2), r3=226(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 56
LDI r2, 341
LDI r3, 226
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
