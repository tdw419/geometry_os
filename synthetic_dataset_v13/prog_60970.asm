; DESCRIPTION: Composite: Creates a magenta rectangular region at (39, 66) spanning 40 by 85 pixels then Creates a blue circular shape at (217, 102) with radius 16 then Places a orange dot at position (511, 244).
; PLAN: r0=39(x), r1=66(y), r2=40(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x), r6=102(y), r7=16(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=511(x), r11=244(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 39
LDI r1, 66
LDI r2, 40
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 102
LDI r7, 16
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 511
LDI r11, 244
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
