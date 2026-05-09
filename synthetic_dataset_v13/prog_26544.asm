; DESCRIPTION: Composite: Sets a single blue pixel at (261, 222) then Draws a green circle centered at (296, 153) with radius 46 then Places a white 83x60 rectangle at position (310, 32).
; PLAN: r0=261(x), r1=222(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=153(y), r7=46(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=310(x), r11=32(y), r12=83(width), r13=60(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 261
LDI r1, 222
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 296
LDI r6, 153
LDI r7, 46
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 310
LDI r11, 32
LDI r12, 83
LDI r13, 60
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
