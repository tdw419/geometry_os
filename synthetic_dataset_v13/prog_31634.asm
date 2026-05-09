; DESCRIPTION: Composite: Renders a green disk with center (164, 175) and radius 79 then Draws a blue rectangle at (437, 68) with width 26 and height 114.
; PLAN: r0=164(x), r1=175(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x), r6=68(y), r7=26(width), r8=114(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 175
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 68
LDI r7, 26
LDI r8, 114
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
