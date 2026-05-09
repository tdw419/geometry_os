; DESCRIPTION: Renders a yellow line between points (205, 237) and (235, 12).
; PLAN: r0=205(x1), r1=237(y1), r2=235(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 237
LDI r2, 235
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
