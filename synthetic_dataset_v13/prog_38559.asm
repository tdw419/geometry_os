; DESCRIPTION: Composite: Draws a blue rectangle at (467, 142) with width 10 and height 114 then Creates a cyan circular shape at (326, 80) with radius 72.
; PLAN: r0=467(x), r1=142(y), r2=10(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=326(x), r6=80(y), r7=72(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 467
LDI r1, 142
LDI r2, 10
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 80
LDI r7, 72
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
