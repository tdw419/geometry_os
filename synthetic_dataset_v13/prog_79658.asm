; DESCRIPTION: Composite: Sets a single purple pixel at (388, 146) then Creates a green circular shape at (51, 159) with radius 40 then Places a yellow 75x52 rectangle at position (41, 26).
; PLAN: r0=388(x), r1=146(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=51(x), r6=159(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=41(x), r11=26(y), r12=75(width), r13=52(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 388
LDI r1, 146
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 51
LDI r6, 159
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 41
LDI r11, 26
LDI r12, 75
LDI r13, 52
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
