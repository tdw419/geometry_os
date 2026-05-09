; DESCRIPTION: Composite: Draws a magenta circle centered at (124, 222) with radius 17 then Places a magenta dot at position (99, 147) then Draws a white rectangle at (443, 102) with width 46 and height 89.
; PLAN: r0=124(x), r1=222(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=99(x), r6=147(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=443(x), r11=102(y), r12=46(width), r13=89(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 124
LDI r1, 222
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 99
LDI r6, 147
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 443
LDI r11, 102
LDI r12, 46
LDI r13, 89
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
