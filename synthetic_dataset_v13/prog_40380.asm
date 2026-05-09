; DESCRIPTION: Renders a black line between points (64, 63) and (316, 158).
; PLAN: r0=64(x1), r1=63(y1), r2=316(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 63
LDI r2, 316
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
