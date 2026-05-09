; DESCRIPTION: Composite: Draws a white rectangle at (154, 11) with width 71 and height 88 then Places a white dot at position (97, 84) then Creates a red circular shape at (174, 80) with radius 52.
; PLAN: r0=154(x), r1=11(y), r2=71(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=97(x), r6=84(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=174(x), r11=80(y), r12=52(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 154
LDI r1, 11
LDI r2, 71
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 84
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 174
LDI r11, 80
LDI r12, 52
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
