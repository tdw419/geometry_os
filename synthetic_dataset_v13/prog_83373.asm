; DESCRIPTION: Renders a magenta line between points (136, 8) and (75, 192).
; PLAN: r0=136(x1), r1=8(y1), r2=75(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 8
LDI r2, 75
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
