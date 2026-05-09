; DESCRIPTION: Composite: Places a white dot at position (42, 51) then Places a yellow circle of radius 49 at center (292, 80) then Draws a black rectangle at (225, 94) with width 38 and height 20.
; PLAN: r0=42(x), r1=51(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=292(x), r6=80(y), r7=49(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=225(x), r11=94(y), r12=38(width), r13=20(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 51
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 292
LDI r6, 80
LDI r7, 49
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 225
LDI r11, 94
LDI r12, 38
LDI r13, 20
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
