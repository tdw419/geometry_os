; DESCRIPTION: Composite: Creates a cyan rectangular region at (263, 109) spanning 109 by 107 pixels then Places a magenta dot at position (114, 119) then Draws a white circle centered at (419, 189) with radius 66.
; PLAN: r0=263(x), r1=109(y), r2=109(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=114(x), r6=119(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=419(x), r11=189(y), r12=66(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 263
LDI r1, 109
LDI r2, 109
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 119
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 419
LDI r11, 189
LDI r12, 66
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
