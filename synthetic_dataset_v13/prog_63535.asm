; DESCRIPTION: Composite: Draws a black rectangle at (385, 33) with width 78 and height 94 then Creates a magenta circular shape at (398, 209) with radius 22 then Places a purple dot at position (333, 6).
; PLAN: r0=385(x), r1=33(y), r2=78(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=398(x), r6=209(y), r7=22(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=333(x), r11=6(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 385
LDI r1, 33
LDI r2, 78
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 209
LDI r7, 22
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 333
LDI r11, 6
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
