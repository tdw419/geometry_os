; DESCRIPTION: Composite: Places a purple dot at position (84, 140) then Places a purple circle of radius 60 at center (76, 87) then Draws a blue rectangle at (342, 98) with width 79 and height 89.
; PLAN: r0=84(x), r1=140(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=76(x), r6=87(y), r7=60(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=342(x), r11=98(y), r12=79(width), r13=89(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 84
LDI r1, 140
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 76
LDI r6, 87
LDI r7, 60
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 342
LDI r11, 98
LDI r12, 79
LDI r13, 89
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
