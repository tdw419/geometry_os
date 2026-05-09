; DESCRIPTION: Composite: Places a white dot at position (249, 221) then Creates a orange circular shape at (359, 77) with radius 76 then Creates a yellow rectangular region at (125, 189) spanning 39 by 37 pixels.
; PLAN: r0=249(x), r1=221(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=77(y), r7=76(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=125(x), r11=189(y), r12=39(width), r13=37(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 221
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 359
LDI r6, 77
LDI r7, 76
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 125
LDI r11, 189
LDI r12, 39
LDI r13, 37
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
