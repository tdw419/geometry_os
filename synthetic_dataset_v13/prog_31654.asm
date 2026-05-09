; DESCRIPTION: Composite: Creates a magenta circular shape at (98, 114) with radius 45 then Places a green dot at position (430, 106) then Creates a green rectangular region at (98, 102) spanning 81 by 109 pixels.
; PLAN: r0=98(x), r1=114(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x), r6=106(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=98(x), r11=102(y), r12=81(width), r13=109(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 98
LDI r1, 114
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 106
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 98
LDI r11, 102
LDI r12, 81
LDI r13, 109
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
