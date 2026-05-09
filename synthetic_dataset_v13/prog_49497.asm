; DESCRIPTION: Composite: Draws a green rectangle at (263, 131) with width 114 and height 87 then Draws a green circle centered at (178, 120) with radius 49.
; PLAN: r0=263(x), r1=131(y), r2=114(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=120(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 263
LDI r1, 131
LDI r2, 114
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 120
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
