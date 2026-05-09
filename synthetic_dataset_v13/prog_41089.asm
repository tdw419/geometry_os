; DESCRIPTION: Renders a yellow line between points (253, 86) and (235, 86).
; PLAN: r0=253(x1), r1=86(y1), r2=235(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 86
LDI r2, 235
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
