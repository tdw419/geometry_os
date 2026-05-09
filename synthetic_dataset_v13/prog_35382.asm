; DESCRIPTION: Renders a yellow line between points (399, 132) and (459, 68).
; PLAN: r0=399(x1), r1=132(y1), r2=459(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 132
LDI r2, 459
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
