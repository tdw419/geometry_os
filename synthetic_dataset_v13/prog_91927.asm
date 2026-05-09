; DESCRIPTION: Composite: Draws a red circle centered at (308, 106) with radius 32 then Renders a blue box of size 77x106 starting at (64, 43).
; PLAN: r0=308(x), r1=106(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=64(x), r6=43(y), r7=77(width), r8=106(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 106
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 64
LDI r6, 43
LDI r7, 77
LDI r8, 106
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
