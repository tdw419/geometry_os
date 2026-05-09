; DESCRIPTION: Composite: Draws a blue circle centered at (403, 81) with radius 41 then Draws a yellow rectangle at (42, 39) with width 69 and height 51.
; PLAN: r0=403(x), r1=81(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x), r6=39(y), r7=69(width), r8=51(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 403
LDI r1, 81
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 39
LDI r7, 69
LDI r8, 51
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
