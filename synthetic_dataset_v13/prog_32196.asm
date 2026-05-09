; DESCRIPTION: Renders a magenta line between points (497, 128) and (325, 31).
; PLAN: r0=497(x1), r1=128(y1), r2=325(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 128
LDI r2, 325
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
