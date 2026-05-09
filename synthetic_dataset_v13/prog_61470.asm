; DESCRIPTION: Composite: Places a yellow circle of radius 51 at center (294, 155) then Places a purple dot at position (241, 112) then Draws a blue rectangle at (307, 142) with width 24 and height 106.
; PLAN: r0=294(x), r1=155(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=241(x), r6=112(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=307(x), r11=142(y), r12=24(width), r13=106(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 155
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 241
LDI r6, 112
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 307
LDI r11, 142
LDI r12, 24
LDI r13, 106
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
