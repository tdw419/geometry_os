; DESCRIPTION: Composite: Draws a orange circle centered at (38, 156) with radius 38 then Places a red 91x110 rectangle at position (183, 9) then Sets a single cyan pixel at (431, 104).
; PLAN: r0=38(x), r1=156(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x), r6=9(y), r7=91(width), r8=110(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=431(x), r11=104(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 38
LDI r1, 156
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 9
LDI r7, 91
LDI r8, 110
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 431
LDI r11, 104
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
