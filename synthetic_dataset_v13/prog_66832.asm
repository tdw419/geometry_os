; DESCRIPTION: Composite: Draws a orange rectangle at (289, 24) with width 77 and height 120 then Renders a black disk with center (74, 197) and radius 21 then Places a purple dot at position (468, 230).
; PLAN: r0=289(x), r1=24(y), r2=77(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x), r6=197(y), r7=21(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=468(x), r11=230(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 289
LDI r1, 24
LDI r2, 77
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 197
LDI r7, 21
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 468
LDI r11, 230
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
