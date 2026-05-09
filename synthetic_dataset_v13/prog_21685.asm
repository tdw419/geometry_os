; DESCRIPTION: Composite: Creates a green rectangular region at (228, 69) spanning 101 by 106 pixels then Places a red dot at position (457, 161) then Draws a white circle centered at (361, 17) with radius 10.
; PLAN: r0=228(x), r1=69(y), r2=101(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=457(x), r6=161(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=361(x), r11=17(y), r12=10(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 228
LDI r1, 69
LDI r2, 101
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 161
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 361
LDI r11, 17
LDI r12, 10
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
