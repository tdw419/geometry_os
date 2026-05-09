; DESCRIPTION: Composite: Creates a cyan rectangular region at (138, 43) spanning 73 by 114 pixels then Draws a black circle centered at (463, 80) with radius 28 then Places a green dot at position (297, 44).
; PLAN: r0=138(x), r1=43(y), r2=73(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=463(x), r6=80(y), r7=28(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=297(x), r11=44(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 138
LDI r1, 43
LDI r2, 73
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 80
LDI r7, 28
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 297
LDI r11, 44
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
