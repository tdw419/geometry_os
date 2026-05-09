; DESCRIPTION: Composite: Places a green dot at position (348, 3) then Draws a purple circle centered at (180, 167) with radius 16 then Draws a green rectangle at (411, 174) with width 97 and height 63.
; PLAN: r0=348(x), r1=3(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=167(y), r7=16(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=411(x), r11=174(y), r12=97(width), r13=63(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 3
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 180
LDI r6, 167
LDI r7, 16
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 411
LDI r11, 174
LDI r12, 97
LDI r13, 63
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
