; DESCRIPTION: Composite: Draws a white rectangle at (318, 6) with width 66 and height 49 then Places a white dot at position (289, 152) then Creates a white circular shape at (146, 127) with radius 66.
; PLAN: r0=318(x), r1=6(y), r2=66(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x), r6=152(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=146(x), r11=127(y), r12=66(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 318
LDI r1, 6
LDI r2, 66
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 152
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 146
LDI r11, 127
LDI r12, 66
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
