; DESCRIPTION: Composite: Places a red 43x30 rectangle at position (247, 136) then Renders a black disk with center (112, 69) and radius 50.
; PLAN: r0=247(x), r1=136(y), r2=43(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x), r6=69(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 247
LDI r1, 136
LDI r2, 43
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 69
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
