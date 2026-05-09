; DESCRIPTION: Composite: Draws a white circle centered at (252, 116) with radius 77 then Creates a orange rectangular region at (225, 178) spanning 78 by 30 pixels then Places a magenta dot at position (304, 233).
; PLAN: r0=252(x), r1=116(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x), r6=178(y), r7=78(width), r8=30(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=304(x), r11=233(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 252
LDI r1, 116
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 178
LDI r7, 78
LDI r8, 30
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 233
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
