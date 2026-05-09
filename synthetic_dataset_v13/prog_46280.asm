; DESCRIPTION: Renders a yellow line between points (312, 32) and (440, 246).
; PLAN: r0=312(x1), r1=32(y1), r2=440(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 32
LDI r2, 440
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
