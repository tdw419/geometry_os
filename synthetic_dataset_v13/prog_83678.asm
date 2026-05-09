; DESCRIPTION: Renders a magenta line between points (112, 36) and (364, 179).
; PLAN: r0=112(x1), r1=36(y1), r2=364(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 36
LDI r2, 364
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
