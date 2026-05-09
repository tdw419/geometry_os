; DESCRIPTION: Composite: Draws a black rectangle at (6, 170) with width 104 and height 22 then Places a purple dot at position (36, 206) then Creates a red circular shape at (208, 189) with radius 48.
; PLAN: r0=6(x), r1=170(y), r2=104(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=36(x), r6=206(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=208(x), r11=189(y), r12=48(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 6
LDI r1, 170
LDI r2, 104
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 206
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 208
LDI r11, 189
LDI r12, 48
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
