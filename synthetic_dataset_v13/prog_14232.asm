; DESCRIPTION: Composite: Creates a green circular shape at (121, 97) with radius 54 then Sets a single green pixel at (180, 40) then Draws a black rectangle at (208, 24) with width 107 and height 91.
; PLAN: r0=121(x), r1=97(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=180(x), r6=40(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=208(x), r11=24(y), r12=107(width), r13=91(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 97
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 180
LDI r6, 40
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 208
LDI r11, 24
LDI r12, 107
LDI r13, 91
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
