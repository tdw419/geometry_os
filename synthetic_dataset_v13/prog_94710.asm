; DESCRIPTION: Composite: Places a green circle of radius 79 at center (159, 161) then Draws a purple rectangle at (233, 114) with width 40 and height 57.
; PLAN: r0=159(x), r1=161(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=233(x), r6=114(y), r7=40(width), r8=57(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 161
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 233
LDI r6, 114
LDI r7, 40
LDI r8, 57
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
