; DESCRIPTION: Composite: Places a magenta circle of radius 74 at center (223, 74) then Draws a blue rectangle at (250, 158) with width 92 and height 64 then Sets a single black pixel at (136, 211).
; PLAN: r0=223(x), r1=74(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x), r6=158(y), r7=92(width), r8=64(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=136(x), r11=211(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 223
LDI r1, 74
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 158
LDI r7, 92
LDI r8, 64
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 136
LDI r11, 211
LDI r12, 0x000000
PSET r10, r11, r12
HALT
