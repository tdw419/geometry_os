; DESCRIPTION: Composite: Creates a magenta circular shape at (324, 171) with radius 41 then Renders a blue box of size 24x62 starting at (121, 137).
; PLAN: r0=324(x), r1=171(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=121(x), r6=137(y), r7=24(width), r8=62(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 171
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 121
LDI r6, 137
LDI r7, 24
LDI r8, 62
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
