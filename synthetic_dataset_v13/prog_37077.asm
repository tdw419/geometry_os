; DESCRIPTION: Composite: Sets a single black pixel at (5, 237) then Draws a blue circle centered at (440, 96) with radius 50 then Creates a cyan rectangular region at (172, 18) spanning 45 by 42 pixels.
; PLAN: r0=5(x), r1=237(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=440(x), r6=96(y), r7=50(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=172(x), r11=18(y), r12=45(width), r13=42(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 5
LDI r1, 237
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 440
LDI r6, 96
LDI r7, 50
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 172
LDI r11, 18
LDI r12, 45
LDI r13, 42
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
