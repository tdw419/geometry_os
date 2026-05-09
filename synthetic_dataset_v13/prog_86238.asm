; DESCRIPTION: Composite: Places a green circle of radius 58 at center (219, 180) then Places a cyan dot at position (327, 46) then Draws a white rectangle at (94, 156) with width 107 and height 44.
; PLAN: r0=219(x), r1=180(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=327(x), r6=46(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=94(x), r11=156(y), r12=107(width), r13=44(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 219
LDI r1, 180
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 327
LDI r6, 46
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 94
LDI r11, 156
LDI r12, 107
LDI r13, 44
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
