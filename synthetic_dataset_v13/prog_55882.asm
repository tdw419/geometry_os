; DESCRIPTION: Composite: Sets a single yellow pixel at (429, 66) then Renders a blue disk with center (155, 132) and radius 53 then Draws a purple rectangle at (405, 41) with width 40 and height 60.
; PLAN: r0=429(x), r1=66(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=155(x), r6=132(y), r7=53(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=405(x), r11=41(y), r12=40(width), r13=60(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 66
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 155
LDI r6, 132
LDI r7, 53
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 405
LDI r11, 41
LDI r12, 40
LDI r13, 60
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
