; DESCRIPTION: Composite: Sets a single blue pixel at (395, 190) then Places a cyan circle of radius 32 at center (460, 58) then Draws a magenta rectangle at (216, 79) with width 14 and height 98.
; PLAN: r0=395(x), r1=190(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=460(x), r6=58(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=216(x), r11=79(y), r12=14(width), r13=98(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 395
LDI r1, 190
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 460
LDI r6, 58
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 216
LDI r11, 79
LDI r12, 14
LDI r13, 98
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
