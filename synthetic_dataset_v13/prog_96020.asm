; DESCRIPTION: Renders a magenta line between points (157, 208) and (241, 191).
; PLAN: r0=157(x1), r1=208(y1), r2=241(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 208
LDI r2, 241
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
