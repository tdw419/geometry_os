; DESCRIPTION: Renders a yellow line between points (165, 232) and (226, 235).
; PLAN: r0=165(x1), r1=232(y1), r2=226(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 232
LDI r2, 226
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
