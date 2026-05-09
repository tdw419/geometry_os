; DESCRIPTION: Composite: Sets a single orange pixel at (296, 219) then Draws a green circle centered at (197, 157) with radius 41 then Renders a red line between points (327, 132) and (414, 112).
; PLAN: r0=296(x), r1=219(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=197(x), r6=157(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=327(x1), r11=132(y1), r12=414(x2), r13=112(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 296
LDI r1, 219
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 197
LDI r6, 157
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 327
LDI r11, 132
LDI r12, 414
LDI r13, 112
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
