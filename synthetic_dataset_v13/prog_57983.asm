; DESCRIPTION: Composite: Draws a purple circle centered at (386, 166) with radius 77 then Draws a blue rectangle at (316, 86) with width 116 and height 115 then Places a red dot at position (301, 48).
; PLAN: r0=386(x), r1=166(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x), r6=86(y), r7=116(width), r8=115(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=301(x), r11=48(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 386
LDI r1, 166
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 86
LDI r7, 116
LDI r8, 115
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 48
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
