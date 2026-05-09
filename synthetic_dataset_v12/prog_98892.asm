; DESCRIPTION: Composite: Draws a blue rectangle at (378, 122) with width 67 and height 98 then Places a yellow dot at position (420, 65) then Places a magenta circle of radius 71 at center (241, 185).
; PLAN: r0=378(x), r1=122(y), r2=67(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x), r6=65(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=241(x), r11=185(y), r12=71(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 378
LDI r1, 122
LDI r2, 67
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 65
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 241
LDI r11, 185
LDI r12, 71
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
