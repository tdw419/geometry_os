; DESCRIPTION: Composite: Draws a black rectangle at (230, 9) with width 46 and height 26 then Places a green circle of radius 25 at center (411, 113).
; PLAN: r0=230(x), r1=9(y), r2=46(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=411(x), r6=113(y), r7=25(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 230
LDI r1, 9
LDI r2, 46
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 113
LDI r7, 25
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
