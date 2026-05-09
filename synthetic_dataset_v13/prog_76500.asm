; DESCRIPTION: Composite: Draws a blue rectangle at (50, 126) with width 74 and height 72 then Draws a purple circle centered at (235, 200) with radius 52.
; PLAN: r0=50(x), r1=126(y), r2=74(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=235(x), r6=200(y), r7=52(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 50
LDI r1, 126
LDI r2, 74
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 200
LDI r7, 52
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
