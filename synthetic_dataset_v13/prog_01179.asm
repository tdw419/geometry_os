; DESCRIPTION: Composite: Draws a white rectangle at (81, 60) with width 51 and height 57 then Places a black dot at position (52, 102) then Draws a yellow circle centered at (370, 135) with radius 62.
; PLAN: r0=81(x), r1=60(y), r2=51(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x), r6=102(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=370(x), r11=135(y), r12=62(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 81
LDI r1, 60
LDI r2, 51
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 102
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 370
LDI r11, 135
LDI r12, 62
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
