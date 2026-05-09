; DESCRIPTION: Composite: Places a red circle of radius 80 at center (199, 138) then Draws a yellow rectangle at (86, 121) with width 40 and height 22.
; PLAN: r0=199(x), r1=138(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=86(x), r6=121(y), r7=40(width), r8=22(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 138
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 86
LDI r6, 121
LDI r7, 40
LDI r8, 22
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
