; DESCRIPTION: Composite: Draws a black circle centered at (192, 146) with radius 27 then Places a orange dot at position (436, 176) then Places a purple 86x111 rectangle at position (275, 84).
; PLAN: r0=192(x), r1=146(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x), r6=176(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=275(x), r11=84(y), r12=86(width), r13=111(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 146
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 176
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 275
LDI r11, 84
LDI r12, 86
LDI r13, 111
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
