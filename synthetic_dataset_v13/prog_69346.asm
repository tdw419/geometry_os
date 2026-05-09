; DESCRIPTION: Composite: Places a blue dot at position (415, 104) then Creates a red rectangular region at (283, 149) spanning 91 by 17 pixels then Places a magenta circle of radius 30 at center (134, 55).
; PLAN: r0=415(x), r1=104(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=283(x), r6=149(y), r7=91(width), r8=17(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=134(x), r11=55(y), r12=30(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 415
LDI r1, 104
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 283
LDI r6, 149
LDI r7, 91
LDI r8, 17
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 55
LDI r12, 30
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
