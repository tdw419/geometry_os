; DESCRIPTION: Composite: Draws a orange circle centered at (175, 124) with radius 78 then Creates a magenta rectangular region at (10, 42) spanning 73 by 112 pixels then Places a green dot at position (66, 40).
; PLAN: r0=175(x), r1=124(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=10(x), r6=42(y), r7=73(width), r8=112(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=66(x), r11=40(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 175
LDI r1, 124
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 10
LDI r6, 42
LDI r7, 73
LDI r8, 112
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 66
LDI r11, 40
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
