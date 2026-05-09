; DESCRIPTION: Composite: Sets a single green pixel at (310, 225) then Creates a white circular shape at (144, 126) with radius 77 then Places a magenta 102x19 rectangle at position (26, 209).
; PLAN: r0=310(x), r1=225(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=144(x), r6=126(y), r7=77(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=26(x), r11=209(y), r12=102(width), r13=19(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 225
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 144
LDI r6, 126
LDI r7, 77
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 26
LDI r11, 209
LDI r12, 102
LDI r13, 19
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
