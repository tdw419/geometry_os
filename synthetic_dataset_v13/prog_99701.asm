; DESCRIPTION: Composite: Places a white dot at position (36, 20) then Draws a magenta rectangle at (200, 28) with width 35 and height 40 then Renders a black disk with center (93, 50) and radius 15.
; PLAN: r0=36(x), r1=20(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=200(x), r6=28(y), r7=35(width), r8=40(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=93(x), r11=50(y), r12=15(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 36
LDI r1, 20
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 200
LDI r6, 28
LDI r7, 35
LDI r8, 40
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 50
LDI r12, 15
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
