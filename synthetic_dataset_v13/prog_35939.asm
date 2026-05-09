; DESCRIPTION: Composite: Sets a single cyan pixel at (309, 27) then Draws a white rectangle at (181, 213) with width 46 and height 17 then Creates a white circular shape at (295, 31) with radius 10.
; PLAN: r0=309(x), r1=27(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=181(x), r6=213(y), r7=46(width), r8=17(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=295(x), r11=31(y), r12=10(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 309
LDI r1, 27
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 181
LDI r6, 213
LDI r7, 46
LDI r8, 17
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 295
LDI r11, 31
LDI r12, 10
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
