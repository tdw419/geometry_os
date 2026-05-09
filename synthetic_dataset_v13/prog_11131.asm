; DESCRIPTION: Composite: Draws a cyan rectangle at (315, 101) with width 68 and height 46 then Places a cyan dot at position (497, 115) then Places a purple circle of radius 11 at center (81, 220).
; PLAN: r0=315(x), r1=101(y), r2=68(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=497(x), r6=115(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=81(x), r11=220(y), r12=11(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 315
LDI r1, 101
LDI r2, 68
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 497
LDI r6, 115
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 81
LDI r11, 220
LDI r12, 11
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
