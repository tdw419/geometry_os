; DESCRIPTION: Composite: Places a black 52x17 rectangle at position (26, 186) then Draws a white circle centered at (423, 178) with radius 44 then Places a white dot at position (1, 34).
; PLAN: r0=26(x), r1=186(y), r2=52(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x), r6=178(y), r7=44(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=1(x), r11=34(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 26
LDI r1, 186
LDI r2, 52
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 178
LDI r7, 44
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 1
LDI r11, 34
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
