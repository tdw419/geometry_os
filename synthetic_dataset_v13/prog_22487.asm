; DESCRIPTION: Composite: Draws a red rectangle at (145, 125) with width 78 and height 53 then Places a blue circle of radius 78 at center (213, 97) then Sets a single blue pixel at (349, 58).
; PLAN: r0=145(x), r1=125(y), r2=78(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x), r6=97(y), r7=78(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=349(x), r11=58(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 145
LDI r1, 125
LDI r2, 78
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 97
LDI r7, 78
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 349
LDI r11, 58
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
