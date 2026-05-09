; DESCRIPTION: Composite: Sets a single cyan pixel at (105, 61) then Places a green circle of radius 46 at center (224, 196) then Creates a yellow rectangular region at (232, 184) spanning 87 by 50 pixels.
; PLAN: r0=105(x), r1=61(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=224(x), r6=196(y), r7=46(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=232(x), r11=184(y), r12=87(width), r13=50(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 61
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 224
LDI r6, 196
LDI r7, 46
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 232
LDI r11, 184
LDI r12, 87
LDI r13, 50
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
