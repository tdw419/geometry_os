; DESCRIPTION: Composite: Places a magenta circle of radius 55 at center (174, 58) then Draws a magenta rectangle at (338, 95) with width 75 and height 49.
; PLAN: r0=174(x), r1=58(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x), r6=95(y), r7=75(width), r8=49(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 174
LDI r1, 58
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 95
LDI r7, 75
LDI r8, 49
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
