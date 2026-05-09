; DESCRIPTION: Composite: Draws a magenta circle centered at (347, 106) with radius 71 then Places a yellow 44x38 rectangle at position (40, 17) then Sets a single purple pixel at (496, 84).
; PLAN: r0=347(x), r1=106(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x), r6=17(y), r7=44(width), r8=38(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=496(x), r11=84(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 347
LDI r1, 106
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 17
LDI r7, 44
LDI r8, 38
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 496
LDI r11, 84
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
