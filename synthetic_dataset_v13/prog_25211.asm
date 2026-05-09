; DESCRIPTION: Composite: Creates a magenta circular shape at (312, 189) with radius 12 then Places a orange dot at position (327, 143) then Renders a purple line between points (155, 215) and (432, 41).
; PLAN: r0=312(x), r1=189(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=327(x), r6=143(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=155(x1), r11=215(y1), r12=432(x2), r13=41(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 312
LDI r1, 189
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 327
LDI r6, 143
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 155
LDI r11, 215
LDI r12, 432
LDI r13, 41
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
