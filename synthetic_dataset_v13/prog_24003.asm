; DESCRIPTION: Composite: Places a purple 48x76 rectangle at position (147, 39) then Places a cyan dot at position (165, 173) then Draws a orange circle centered at (112, 161) with radius 67.
; PLAN: r0=147(x), r1=39(y), r2=48(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=165(x), r6=173(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=112(x), r11=161(y), r12=67(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 147
LDI r1, 39
LDI r2, 48
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 173
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 112
LDI r11, 161
LDI r12, 67
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
