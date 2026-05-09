; DESCRIPTION: Renders a yellow line between points (72, 159) and (185, 224).
; PLAN: r0=72(x1), r1=159(y1), r2=185(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 159
LDI r2, 185
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
