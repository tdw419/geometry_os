; DESCRIPTION: Renders a purple line between points (128, 57) and (257, 128).
; PLAN: r0=128(x1), r1=57(y1), r2=257(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 57
LDI r2, 257
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
