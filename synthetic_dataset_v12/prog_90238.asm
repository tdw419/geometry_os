; DESCRIPTION: Composite: Creates a cyan rectangular region at (149, 107) spanning 35 by 116 pixels then Places a yellow dot at position (75, 209) then Creates a blue circular shape at (167, 156) with radius 24.
; PLAN: r0=149(x), r1=107(y), r2=35(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x), r6=209(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=167(x), r11=156(y), r12=24(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 149
LDI r1, 107
LDI r2, 35
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 209
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 167
LDI r11, 156
LDI r12, 24
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
