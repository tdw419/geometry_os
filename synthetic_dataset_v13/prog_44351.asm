; DESCRIPTION: Composite: Renders a cyan line between points (112, 245) and (476, 105) then Renders a black disk with center (59, 82) and radius 19.
; PLAN: r0=112(x1), r1=245(y1), r2=476(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=82(y), r7=19(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 112
LDI r1, 245
LDI r2, 476
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 82
LDI r7, 19
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
