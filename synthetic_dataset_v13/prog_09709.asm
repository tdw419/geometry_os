; DESCRIPTION: Composite: Draws a cyan circle centered at (327, 76) with radius 64 then Places a green dot at position (392, 158) then Draws a green rectangle at (431, 150) with width 16 and height 25.
; PLAN: r0=327(x), r1=76(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=392(x), r6=158(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=431(x), r11=150(y), r12=16(width), r13=25(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 327
LDI r1, 76
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 392
LDI r6, 158
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 431
LDI r11, 150
LDI r12, 16
LDI r13, 25
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
