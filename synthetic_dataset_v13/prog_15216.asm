; DESCRIPTION: Composite: Places a red dot at position (234, 230) then Places a green circle of radius 18 at center (268, 56) then Creates a purple rectangular region at (202, 7) spanning 66 by 88 pixels.
; PLAN: r0=234(x), r1=230(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=268(x), r6=56(y), r7=18(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=202(x), r11=7(y), r12=66(width), r13=88(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 234
LDI r1, 230
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 268
LDI r6, 56
LDI r7, 18
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 202
LDI r11, 7
LDI r12, 66
LDI r13, 88
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
