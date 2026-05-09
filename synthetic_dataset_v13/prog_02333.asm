; DESCRIPTION: Composite: Creates a orange circular shape at (370, 103) with radius 79 then Places a magenta dot at position (408, 157) then Draws a cyan rectangle at (340, 212) with width 108 and height 31.
; PLAN: r0=370(x), r1=103(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=408(x), r6=157(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=340(x), r11=212(y), r12=108(width), r13=31(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 103
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 408
LDI r6, 157
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 340
LDI r11, 212
LDI r12, 108
LDI r13, 31
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
