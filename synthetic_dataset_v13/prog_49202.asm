; DESCRIPTION: Composite: Draws a blue circle centered at (460, 159) with radius 49 then Renders a black box of size 52x56 starting at (260, 100).
; PLAN: r0=460(x), r1=159(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x), r6=100(y), r7=52(width), r8=56(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 460
LDI r1, 159
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 100
LDI r7, 52
LDI r8, 56
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
