; DESCRIPTION: Composite: Places a cyan dot at position (378, 49) then Places a magenta circle of radius 52 at center (192, 79) then Creates a white rectangular region at (108, 65) spanning 47 by 19 pixels.
; PLAN: r0=378(x), r1=49(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=192(x), r6=79(y), r7=52(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=108(x), r11=65(y), r12=47(width), r13=19(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 49
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 192
LDI r6, 79
LDI r7, 52
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 108
LDI r11, 65
LDI r12, 47
LDI r13, 19
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
