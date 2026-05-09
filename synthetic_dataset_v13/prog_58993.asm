; DESCRIPTION: Composite: Draws a purple circle centered at (457, 192) with radius 29 then Places a green 96x84 rectangle at position (277, 8) then Sets a single black pixel at (309, 41).
; PLAN: r0=457(x), r1=192(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=277(x), r6=8(y), r7=96(width), r8=84(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=309(x), r11=41(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 457
LDI r1, 192
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 277
LDI r6, 8
LDI r7, 96
LDI r8, 84
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 41
LDI r12, 0x000000
PSET r10, r11, r12
HALT
