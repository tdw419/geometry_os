; DESCRIPTION: Composite: Places a black dot at position (167, 87) then Draws a cyan circle centered at (375, 25) with radius 24 then Creates a black rectangular region at (180, 94) spanning 40 by 37 pixels.
; PLAN: r0=167(x), r1=87(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=375(x), r6=25(y), r7=24(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=180(x), r11=94(y), r12=40(width), r13=37(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 87
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 375
LDI r6, 25
LDI r7, 24
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 180
LDI r11, 94
LDI r12, 40
LDI r13, 37
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
