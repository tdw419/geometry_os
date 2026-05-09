; DESCRIPTION: Composite: Creates a magenta circular shape at (201, 94) with radius 79 then Places a magenta 69x56 rectangle at position (232, 183) then Sets a single cyan pixel at (482, 96).
; PLAN: r0=201(x), r1=94(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=232(x), r6=183(y), r7=69(width), r8=56(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=482(x), r11=96(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 201
LDI r1, 94
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 232
LDI r6, 183
LDI r7, 69
LDI r8, 56
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 482
LDI r11, 96
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
