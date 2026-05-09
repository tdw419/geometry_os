; DESCRIPTION: Composite: Places a purple dot at position (52, 180) then Draws a yellow rectangle at (411, 97) with width 71 and height 38 then Draws a black circle centered at (210, 105) with radius 19.
; PLAN: r0=52(x), r1=180(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=411(x), r6=97(y), r7=71(width), r8=38(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=210(x), r11=105(y), r12=19(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 52
LDI r1, 180
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 411
LDI r6, 97
LDI r7, 71
LDI r8, 38
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 105
LDI r12, 19
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
