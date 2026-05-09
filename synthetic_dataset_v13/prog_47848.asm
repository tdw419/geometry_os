; DESCRIPTION: Composite: Sets a single green pixel at (16, 113) then Creates a magenta circular shape at (208, 107) with radius 27 then Creates a purple rectangular region at (99, 104) spanning 119 by 91 pixels.
; PLAN: r0=16(x), r1=113(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=208(x), r6=107(y), r7=27(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=99(x), r11=104(y), r12=119(width), r13=91(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 16
LDI r1, 113
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 208
LDI r6, 107
LDI r7, 27
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 99
LDI r11, 104
LDI r12, 119
LDI r13, 91
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
