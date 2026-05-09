; DESCRIPTION: Composite: Sets a single green pixel at (10, 250) then Creates a yellow circular shape at (365, 38) with radius 36 then Draws a black line from (494, 82) to (119, 252).
; PLAN: r0=10(x), r1=250(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=365(x), r6=38(y), r7=36(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=494(x1), r11=82(y1), r12=119(x2), r13=252(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 10
LDI r1, 250
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 365
LDI r6, 38
LDI r7, 36
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 494
LDI r11, 82
LDI r12, 119
LDI r13, 252
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
