; DESCRIPTION: Renders a black line between points (480, 155) and (285, 245).
; PLAN: r0=480(x1), r1=155(y1), r2=285(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 155
LDI r2, 285
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
