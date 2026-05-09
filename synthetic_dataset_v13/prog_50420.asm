; DESCRIPTION: Composite: Sets a single cyan pixel at (0, 75) then Draws a magenta circle centered at (284, 57) with radius 37 then Creates a white rectangular region at (82, 122) spanning 100 by 105 pixels.
; PLAN: r0=0(x), r1=75(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=284(x), r6=57(y), r7=37(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=82(x), r11=122(y), r12=100(width), r13=105(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 0
LDI r1, 75
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 284
LDI r6, 57
LDI r7, 37
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 82
LDI r11, 122
LDI r12, 100
LDI r13, 105
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
