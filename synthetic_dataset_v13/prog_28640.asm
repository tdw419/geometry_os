; DESCRIPTION: Composite: Places a blue dot at position (453, 186) then Places a blue circle of radius 65 at center (87, 148) then Draws a yellow rectangle at (226, 138) with width 37 and height 32.
; PLAN: r0=453(x), r1=186(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=87(x), r6=148(y), r7=65(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=226(x), r11=138(y), r12=37(width), r13=32(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 453
LDI r1, 186
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 87
LDI r6, 148
LDI r7, 65
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 226
LDI r11, 138
LDI r12, 37
LDI r13, 32
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
