; DESCRIPTION: Composite: Renders a black box of size 94x19 starting at (50, 40) then Draws a blue circle centered at (269, 143) with radius 67 then Places a yellow dot at position (57, 17).
; PLAN: r0=50(x), r1=40(y), r2=94(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=269(x), r6=143(y), r7=67(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=57(x), r11=17(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 50
LDI r1, 40
LDI r2, 94
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 143
LDI r7, 67
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 57
LDI r11, 17
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
