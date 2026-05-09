; DESCRIPTION: Renders a green line between points (237, 141) and (318, 148).
; PLAN: r0=237(x1), r1=141(y1), r2=318(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 141
LDI r2, 318
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
