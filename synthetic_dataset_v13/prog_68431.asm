; DESCRIPTION: Composite: Draws a cyan circle centered at (344, 184) with radius 60 then Draws a orange rectangle at (40, 80) with width 13 and height 96 then Places a cyan dot at position (234, 28).
; PLAN: r0=344(x), r1=184(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x), r6=80(y), r7=13(width), r8=96(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=234(x), r11=28(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 344
LDI r1, 184
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 80
LDI r7, 13
LDI r8, 96
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 28
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
