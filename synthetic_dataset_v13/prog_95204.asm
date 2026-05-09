; DESCRIPTION: Composite: Places a magenta circle of radius 63 at center (322, 175) then Draws a blue rectangle at (483, 152) with width 15 and height 47 then Places a purple dot at position (454, 214).
; PLAN: r0=322(x), r1=175(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x), r6=152(y), r7=15(width), r8=47(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=454(x), r11=214(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 322
LDI r1, 175
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 152
LDI r7, 15
LDI r8, 47
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 214
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
