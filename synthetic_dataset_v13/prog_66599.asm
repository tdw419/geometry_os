; DESCRIPTION: Composite: Renders a magenta box of size 100x41 starting at (402, 34) then Draws a red circle centered at (103, 155) with radius 51.
; PLAN: r0=402(x), r1=34(y), r2=100(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x), r6=155(y), r7=51(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 402
LDI r1, 34
LDI r2, 100
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 155
LDI r7, 51
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
