; DESCRIPTION: Composite: Draws a magenta rectangle at (284, 28) with width 70 and height 108 then Places a black dot at position (6, 237) then Creates a magenta circular shape at (161, 197) with radius 32.
; PLAN: r0=284(x), r1=28(y), r2=70(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=6(x), r6=237(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=161(x), r11=197(y), r12=32(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 284
LDI r1, 28
LDI r2, 70
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 237
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 161
LDI r11, 197
LDI r12, 32
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
