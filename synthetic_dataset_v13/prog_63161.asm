; DESCRIPTION: Renders a yellow line between points (8, 84) and (496, 103).
; PLAN: r0=8(x1), r1=84(y1), r2=496(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 84
LDI r2, 496
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
