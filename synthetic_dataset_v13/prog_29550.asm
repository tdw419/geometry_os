; DESCRIPTION: Composite: Places a green circle of radius 24 at center (446, 138) then Draws a green rectangle at (225, 199) with width 111 and height 43.
; PLAN: r0=446(x), r1=138(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x), r6=199(y), r7=111(width), r8=43(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 446
LDI r1, 138
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 199
LDI r7, 111
LDI r8, 43
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
