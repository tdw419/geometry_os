; DESCRIPTION: Composite: Places a yellow dot at position (490, 239) then Draws a orange rectangle at (379, 21) with width 15 and height 34 then Places a black circle of radius 27 at center (40, 193).
; PLAN: r0=490(x), r1=239(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=379(x), r6=21(y), r7=15(width), r8=34(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=40(x), r11=193(y), r12=27(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 490
LDI r1, 239
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 379
LDI r6, 21
LDI r7, 15
LDI r8, 34
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 40
LDI r11, 193
LDI r12, 27
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
