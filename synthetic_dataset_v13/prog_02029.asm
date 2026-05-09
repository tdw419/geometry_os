; DESCRIPTION: Composite: Sets a single cyan pixel at (164, 45) then Draws a red rectangle at (239, 156) with width 45 and height 90 then Draws a black circle centered at (206, 152) with radius 65.
; PLAN: r0=164(x), r1=45(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=239(x), r6=156(y), r7=45(width), r8=90(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=206(x), r11=152(y), r12=65(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 164
LDI r1, 45
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 239
LDI r6, 156
LDI r7, 45
LDI r8, 90
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 152
LDI r12, 65
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
