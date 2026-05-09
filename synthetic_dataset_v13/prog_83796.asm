; DESCRIPTION: Renders a black line between points (86, 248) and (358, 28).
; PLAN: r0=86(x1), r1=248(y1), r2=358(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 248
LDI r2, 358
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
