; DESCRIPTION: Renders a blue line between points (172, 144) and (106, 12).
; PLAN: r0=172(x1), r1=144(y1), r2=106(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 144
LDI r2, 106
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
