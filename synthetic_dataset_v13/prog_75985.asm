; DESCRIPTION: Composite: Creates a white rectangular region at (420, 81) spanning 66 by 14 pixels then Places a magenta circle of radius 23 at center (163, 222) then Sets a single yellow pixel at (377, 135).
; PLAN: r0=420(x), r1=81(y), r2=66(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=163(x), r6=222(y), r7=23(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=377(x), r11=135(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 420
LDI r1, 81
LDI r2, 66
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 222
LDI r7, 23
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 377
LDI r11, 135
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
