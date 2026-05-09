; DESCRIPTION: Composite: Draws a white rectangle at (145, 123) with width 80 and height 14 then Draws a black circle centered at (61, 150) with radius 30.
; PLAN: r0=145(x), r1=123(y), r2=80(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=61(x), r6=150(y), r7=30(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 145
LDI r1, 123
LDI r2, 80
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 150
LDI r7, 30
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
