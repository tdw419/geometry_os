; DESCRIPTION: Composite: Draws a cyan rectangle at (316, 177) with width 20 and height 40 then Places a yellow dot at position (497, 80) then Draws a green circle centered at (349, 83) with radius 54.
; PLAN: r0=316(x), r1=177(y), r2=20(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=497(x), r6=80(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=349(x), r11=83(y), r12=54(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 316
LDI r1, 177
LDI r2, 20
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 497
LDI r6, 80
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 349
LDI r11, 83
LDI r12, 54
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
