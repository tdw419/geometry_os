; DESCRIPTION: Composite: Places a magenta dot at position (42, 37) then Draws a purple circle centered at (346, 72) with radius 38 then Creates a cyan rectangular region at (159, 76) spanning 47 by 14 pixels.
; PLAN: r0=42(x), r1=37(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=72(y), r7=38(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=159(x), r11=76(y), r12=47(width), r13=14(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 37
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 346
LDI r6, 72
LDI r7, 38
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 159
LDI r11, 76
LDI r12, 47
LDI r13, 14
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
