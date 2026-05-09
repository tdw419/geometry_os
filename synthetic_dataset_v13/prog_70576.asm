; DESCRIPTION: Composite: Draws a yellow rectangle at (164, 0) with width 94 and height 55 then Draws a red circle centered at (421, 112) with radius 21 then Places a purple dot at position (242, 128).
; PLAN: r0=164(x), r1=0(y), r2=94(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x), r6=112(y), r7=21(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=242(x), r11=128(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 0
LDI r2, 94
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 112
LDI r7, 21
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 242
LDI r11, 128
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
