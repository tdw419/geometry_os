; DESCRIPTION: Composite: Places a magenta circle of radius 44 at center (49, 140) then Draws a orange rectangle at (93, 162) with width 114 and height 59.
; PLAN: r0=49(x), r1=140(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x), r6=162(y), r7=114(width), r8=59(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 49
LDI r1, 140
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 162
LDI r7, 114
LDI r8, 59
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
