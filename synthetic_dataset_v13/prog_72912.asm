; DESCRIPTION: Renders a magenta line between points (106, 237) and (20, 159).
; PLAN: r0=106(x1), r1=237(y1), r2=20(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 237
LDI r2, 20
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
