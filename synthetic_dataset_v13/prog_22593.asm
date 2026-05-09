; DESCRIPTION: Renders a purple line between points (440, 199) and (8, 164).
; PLAN: r0=440(x1), r1=199(y1), r2=8(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 199
LDI r2, 8
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
