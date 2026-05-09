; DESCRIPTION: Composite: Sets a single green pixel at (433, 130) then Creates a magenta rectangular region at (380, 9) spanning 119 by 97 pixels then Places a yellow circle of radius 56 at center (163, 57).
; PLAN: r0=433(x), r1=130(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=380(x), r6=9(y), r7=119(width), r8=97(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=163(x), r11=57(y), r12=56(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 433
LDI r1, 130
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 380
LDI r6, 9
LDI r7, 119
LDI r8, 97
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 163
LDI r11, 57
LDI r12, 56
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
