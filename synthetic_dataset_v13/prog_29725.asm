; DESCRIPTION: Composite: Draws a yellow rectangle at (207, 168) with width 18 and height 12 then Draws a red circle centered at (191, 35) with radius 35.
; PLAN: r0=207(x), r1=168(y), r2=18(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x), r6=35(y), r7=35(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 207
LDI r1, 168
LDI r2, 18
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 35
LDI r7, 35
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
