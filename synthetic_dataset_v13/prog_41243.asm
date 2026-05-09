; DESCRIPTION: Renders a yellow line between points (461, 50) and (185, 144).
; PLAN: r0=461(x1), r1=50(y1), r2=185(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 50
LDI r2, 185
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
