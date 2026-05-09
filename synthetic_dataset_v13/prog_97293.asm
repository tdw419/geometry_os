; DESCRIPTION: Composite: Renders a yellow line between points (270, 147) and (41, 228) then Sets a single yellow pixel at (307, 147) then Creates a red circular shape at (275, 78) with radius 53.
; PLAN: r0=270(x1), r1=147(y1), r2=41(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=147(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=275(x), r11=78(y), r12=53(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 270
LDI r1, 147
LDI r2, 41
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 147
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 275
LDI r11, 78
LDI r12, 53
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
