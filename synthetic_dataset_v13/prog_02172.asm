; DESCRIPTION: Composite: Sets a single yellow pixel at (245, 187) then Places a white circle of radius 53 at center (387, 193) then Draws a orange rectangle at (257, 199) with width 76 and height 28.
; PLAN: r0=245(x), r1=187(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=387(x), r6=193(y), r7=53(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=257(x), r11=199(y), r12=76(width), r13=28(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 245
LDI r1, 187
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 387
LDI r6, 193
LDI r7, 53
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 257
LDI r11, 199
LDI r12, 76
LDI r13, 28
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
