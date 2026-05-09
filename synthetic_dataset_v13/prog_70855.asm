; DESCRIPTION: Composite: Draws a purple rectangle at (135, 142) with width 24 and height 96 then Places a green dot at position (86, 213) then Creates a magenta circular shape at (169, 107) with radius 73.
; PLAN: r0=135(x), r1=142(y), r2=24(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=213(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=169(x), r11=107(y), r12=73(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 135
LDI r1, 142
LDI r2, 24
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 213
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 169
LDI r11, 107
LDI r12, 73
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
