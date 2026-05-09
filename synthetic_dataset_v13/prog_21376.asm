; DESCRIPTION: Renders a yellow line between points (130, 237) and (237, 74).
; PLAN: r0=130(x1), r1=237(y1), r2=237(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 237
LDI r2, 237
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
