; DESCRIPTION: Composite: Creates a blue rectangular region at (274, 9) spanning 75 by 99 pixels then Draws a magenta circle centered at (118, 191) with radius 47 then Places a purple dot at position (102, 92).
; PLAN: r0=274(x), r1=9(y), r2=75(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x), r6=191(y), r7=47(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=102(x), r11=92(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 274
LDI r1, 9
LDI r2, 75
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 191
LDI r7, 47
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 102
LDI r11, 92
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
