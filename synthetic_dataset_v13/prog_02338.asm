; DESCRIPTION: Composite: Draws a red rectangle at (321, 19) with width 10 and height 115 then Places a magenta dot at position (65, 100) then Draws a purple circle centered at (306, 126) with radius 17.
; PLAN: r0=321(x), r1=19(y), r2=10(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x), r6=100(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=306(x), r11=126(y), r12=17(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 321
LDI r1, 19
LDI r2, 10
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 100
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 306
LDI r11, 126
LDI r12, 17
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
