; DESCRIPTION: Composite: Draws a yellow rectangle at (260, 86) with width 78 and height 108 then Sets a single white pixel at (381, 15) then Places a cyan line segment connecting (494, 49) to (37, 255).
; PLAN: r0=260(x), r1=86(y), r2=78(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x), r6=15(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=494(x1), r11=49(y1), r12=37(x2), r13=255(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 86
LDI r2, 78
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 15
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 494
LDI r11, 49
LDI r12, 37
LDI r13, 255
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
