; DESCRIPTION: Composite: Places a green dot at position (9, 44) then Places a red 26x95 rectangle at position (207, 100) then Draws a cyan circle centered at (329, 86) with radius 15.
; PLAN: r0=9(x), r1=44(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=100(y), r7=26(width), r8=95(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=329(x), r11=86(y), r12=15(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 9
LDI r1, 44
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 207
LDI r6, 100
LDI r7, 26
LDI r8, 95
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 86
LDI r12, 15
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
