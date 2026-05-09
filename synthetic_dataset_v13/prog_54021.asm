; DESCRIPTION: Renders a purple line between points (257, 181) and (282, 162).
; PLAN: r0=257(x1), r1=181(y1), r2=282(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 181
LDI r2, 282
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
