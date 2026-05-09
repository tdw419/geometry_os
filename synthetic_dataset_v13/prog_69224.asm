; DESCRIPTION: Composite: Draws a purple rectangle at (362, 115) with width 24 and height 22 then Draws a blue circle centered at (465, 139) with radius 10 then Places a black dot at position (373, 161).
; PLAN: r0=362(x), r1=115(y), r2=24(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=465(x), r6=139(y), r7=10(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=373(x), r11=161(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 362
LDI r1, 115
LDI r2, 24
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 139
LDI r7, 10
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 373
LDI r11, 161
LDI r12, 0x000000
PSET r10, r11, r12
HALT
