; DESCRIPTION: Composite: Renders a blue disk with center (450, 75) and radius 55 then Draws a black rectangle at (405, 183) with width 107 and height 10 then Places a cyan dot at position (229, 151).
; PLAN: r0=450(x), r1=75(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=405(x), r6=183(y), r7=107(width), r8=10(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=229(x), r11=151(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 450
LDI r1, 75
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 405
LDI r6, 183
LDI r7, 107
LDI r8, 10
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 151
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
