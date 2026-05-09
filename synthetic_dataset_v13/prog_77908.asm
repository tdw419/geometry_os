; DESCRIPTION: Renders a blue line between points (136, 248) and (365, 248).
; PLAN: r0=136(x1), r1=248(y1), r2=365(x2), r3=248(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 248
LDI r2, 365
LDI r3, 248
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
