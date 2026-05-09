; DESCRIPTION: Composite: Places a purple dot at position (281, 4) then Places a yellow 11x82 rectangle at position (217, 6) then Draws a blue circle centered at (129, 195) with radius 57.
; PLAN: r0=281(x), r1=4(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=6(y), r7=11(width), r8=82(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=129(x), r11=195(y), r12=57(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 281
LDI r1, 4
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 6
LDI r7, 11
LDI r8, 82
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 195
LDI r12, 57
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
