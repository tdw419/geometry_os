; DESCRIPTION: Composite: Places a cyan dot at position (273, 165) then Creates a orange circular shape at (36, 43) with radius 25 then Draws a red rectangle at (151, 6) with width 18 and height 82.
; PLAN: r0=273(x), r1=165(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=36(x), r6=43(y), r7=25(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=151(x), r11=6(y), r12=18(width), r13=82(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 165
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 36
LDI r6, 43
LDI r7, 25
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 151
LDI r11, 6
LDI r12, 18
LDI r13, 82
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
