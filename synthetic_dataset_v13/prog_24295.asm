; DESCRIPTION: Renders a black line between points (288, 154) and (163, 12).
; PLAN: r0=288(x1), r1=154(y1), r2=163(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 154
LDI r2, 163
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
