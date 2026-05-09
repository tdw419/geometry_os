; DESCRIPTION: Composite: Draws a green rectangle at (106, 241) with width 45 and height 10 then Places a blue dot at position (411, 92) then Creates a black circular shape at (110, 205) with radius 19.
; PLAN: r0=106(x), r1=241(y), r2=45(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=411(x), r6=92(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=110(x), r11=205(y), r12=19(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 106
LDI r1, 241
LDI r2, 45
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 92
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 110
LDI r11, 205
LDI r12, 19
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
