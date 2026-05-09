; DESCRIPTION: Composite: Sets a single orange pixel at (46, 174) then Draws a black rectangle at (461, 147) with width 16 and height 28 then Draws a black circle centered at (262, 62) with radius 57.
; PLAN: r0=46(x), r1=174(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=461(x), r6=147(y), r7=16(width), r8=28(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=262(x), r11=62(y), r12=57(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 46
LDI r1, 174
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 461
LDI r6, 147
LDI r7, 16
LDI r8, 28
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 62
LDI r12, 57
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
