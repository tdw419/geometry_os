; DESCRIPTION: Composite: Draws a blue circle centered at (401, 58) with radius 49 then Creates a black rectangular region at (311, 146) spanning 79 by 34 pixels then Places a white dot at position (146, 125).
; PLAN: r0=401(x), r1=58(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x), r6=146(y), r7=79(width), r8=34(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=146(x), r11=125(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 401
LDI r1, 58
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 146
LDI r7, 79
LDI r8, 34
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 125
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
