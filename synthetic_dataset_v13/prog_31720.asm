; DESCRIPTION: Renders a blue line between points (325, 52) and (316, 64).
; PLAN: r0=325(x1), r1=52(y1), r2=316(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 52
LDI r2, 316
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
