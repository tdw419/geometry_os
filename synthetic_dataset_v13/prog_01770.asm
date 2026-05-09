; DESCRIPTION: Composite: Places a white dot at position (125, 189) then Draws a white rectangle at (305, 97) with width 63 and height 43 then Places a black circle of radius 62 at center (75, 192).
; PLAN: r0=125(x), r1=189(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=305(x), r6=97(y), r7=63(width), r8=43(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=75(x), r11=192(y), r12=62(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 125
LDI r1, 189
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 305
LDI r6, 97
LDI r7, 63
LDI r8, 43
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 192
LDI r12, 62
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
