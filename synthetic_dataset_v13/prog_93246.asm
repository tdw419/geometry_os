; DESCRIPTION: Composite: Draws a cyan rectangle at (167, 176) with width 42 and height 40 then Creates a red circular shape at (206, 137) with radius 46 then Places a orange dot at position (460, 167).
; PLAN: r0=167(x), r1=176(y), r2=42(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x), r6=137(y), r7=46(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=460(x), r11=167(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 167
LDI r1, 176
LDI r2, 42
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 137
LDI r7, 46
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 460
LDI r11, 167
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
