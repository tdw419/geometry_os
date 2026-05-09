; DESCRIPTION: Renders a black line between points (294, 136) and (36, 255).
; PLAN: r0=294(x1), r1=136(y1), r2=36(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 136
LDI r2, 36
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
