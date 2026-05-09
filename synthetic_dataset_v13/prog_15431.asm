; DESCRIPTION: Renders a yellow line between points (20, 235) and (396, 58).
; PLAN: r0=20(x1), r1=235(y1), r2=396(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 235
LDI r2, 396
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
