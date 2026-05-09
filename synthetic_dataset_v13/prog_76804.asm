; DESCRIPTION: Renders a yellow line between points (430, 32) and (8, 165).
; PLAN: r0=430(x1), r1=32(y1), r2=8(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 32
LDI r2, 8
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
