; DESCRIPTION: Composite: Places a cyan dot at position (304, 22) then Renders a white disk with center (105, 149) and radius 67 then Creates a cyan rectangular region at (239, 172) spanning 19 by 73 pixels.
; PLAN: r0=304(x), r1=22(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=105(x), r6=149(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=239(x), r11=172(y), r12=19(width), r13=73(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 22
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 105
LDI r6, 149
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 239
LDI r11, 172
LDI r12, 19
LDI r13, 73
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
