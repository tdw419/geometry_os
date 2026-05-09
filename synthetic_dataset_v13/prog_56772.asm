; DESCRIPTION: Composite: Creates a white rectangular region at (244, 16) spanning 58 by 90 pixels then Draws a yellow circle centered at (280, 67) with radius 67 then Places a black dot at position (124, 242).
; PLAN: r0=244(x), r1=16(y), r2=58(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=67(y), r7=67(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=124(x), r11=242(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 244
LDI r1, 16
LDI r2, 58
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 67
LDI r7, 67
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 124
LDI r11, 242
LDI r12, 0x000000
PSET r10, r11, r12
HALT
