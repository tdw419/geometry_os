; DESCRIPTION: Draws a green line from (496, 53) to (81, 155).
; PLAN: r0=496(x1), r1=53(y1), r2=81(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 53
LDI r2, 81
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
