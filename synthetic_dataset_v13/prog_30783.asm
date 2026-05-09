; DESCRIPTION: Composite: Places a white dot at position (466, 15) then Draws a cyan rectangle at (345, 15) with width 74 and height 119 then Places a magenta circle of radius 70 at center (174, 102).
; PLAN: r0=466(x), r1=15(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=345(x), r6=15(y), r7=74(width), r8=119(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=174(x), r11=102(y), r12=70(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 466
LDI r1, 15
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 345
LDI r6, 15
LDI r7, 74
LDI r8, 119
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 102
LDI r12, 70
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
