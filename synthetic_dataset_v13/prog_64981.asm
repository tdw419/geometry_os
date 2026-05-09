; DESCRIPTION: Composite: Creates a cyan circular shape at (439, 52) with radius 19 then Draws a white rectangle at (427, 58) with width 20 and height 104 then Places a black dot at position (96, 223).
; PLAN: r0=439(x), r1=52(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=427(x), r6=58(y), r7=20(width), r8=104(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=96(x), r11=223(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 439
LDI r1, 52
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 427
LDI r6, 58
LDI r7, 20
LDI r8, 104
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 223
LDI r12, 0x000000
PSET r10, r11, r12
HALT
