; DESCRIPTION: Composite: Sets a single cyan pixel at (240, 141) then Draws a purple rectangle at (212, 207) with width 103 and height 39 then Creates a white circular shape at (491, 189) with radius 21.
; PLAN: r0=240(x), r1=141(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=212(x), r6=207(y), r7=103(width), r8=39(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=491(x), r11=189(y), r12=21(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 240
LDI r1, 141
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 212
LDI r6, 207
LDI r7, 103
LDI r8, 39
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 491
LDI r11, 189
LDI r12, 21
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
