; DESCRIPTION: Composite: Sets a single black pixel at (487, 148) then Draws a green circle centered at (291, 165) with radius 50 then Places a yellow 88x69 rectangle at position (20, 128).
; PLAN: r0=487(x), r1=148(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=291(x), r6=165(y), r7=50(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=20(x), r11=128(y), r12=88(width), r13=69(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 487
LDI r1, 148
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 291
LDI r6, 165
LDI r7, 50
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 20
LDI r11, 128
LDI r12, 88
LDI r13, 69
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
