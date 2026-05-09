; DESCRIPTION: Renders a blue line between points (206, 144) and (381, 191).
; PLAN: r0=206(x1), r1=144(y1), r2=381(x2), r3=191(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 144
LDI r2, 381
LDI r3, 191
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
