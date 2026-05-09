; DESCRIPTION: Composite: Sets a single red pixel at (499, 20) then Draws a white circle centered at (270, 189) with radius 56 then Places a green 73x19 rectangle at position (254, 61).
; PLAN: r0=499(x), r1=20(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=270(x), r6=189(y), r7=56(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=254(x), r11=61(y), r12=73(width), r13=19(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 499
LDI r1, 20
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 270
LDI r6, 189
LDI r7, 56
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 254
LDI r11, 61
LDI r12, 73
LDI r13, 19
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
