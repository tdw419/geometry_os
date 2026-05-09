; DESCRIPTION: Composite: Places a green dot at position (129, 172) then Places a red circle of radius 35 at center (421, 132) then Creates a purple rectangular region at (233, 163) spanning 37 by 21 pixels.
; PLAN: r0=129(x), r1=172(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=421(x), r6=132(y), r7=35(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=233(x), r11=163(y), r12=37(width), r13=21(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 129
LDI r1, 172
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 421
LDI r6, 132
LDI r7, 35
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 233
LDI r11, 163
LDI r12, 37
LDI r13, 21
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
