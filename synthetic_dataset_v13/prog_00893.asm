; DESCRIPTION: Composite: Places a white dot at position (62, 209) then Renders a magenta box of size 18x105 starting at (227, 74) then Places a white circle of radius 41 at center (447, 161).
; PLAN: r0=62(x), r1=209(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=227(x), r6=74(y), r7=18(width), r8=105(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=447(x), r11=161(y), r12=41(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 62
LDI r1, 209
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 227
LDI r6, 74
LDI r7, 18
LDI r8, 105
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 447
LDI r11, 161
LDI r12, 41
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
