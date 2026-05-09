; DESCRIPTION: Composite: Sets a single purple pixel at (108, 36) then Creates a blue rectangular region at (320, 3) spanning 55 by 90 pixels then Draws a purple circle centered at (52, 87) with radius 42.
; PLAN: r0=108(x), r1=36(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=320(x), r6=3(y), r7=55(width), r8=90(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=52(x), r11=87(y), r12=42(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 108
LDI r1, 36
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 320
LDI r6, 3
LDI r7, 55
LDI r8, 90
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 52
LDI r11, 87
LDI r12, 42
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
