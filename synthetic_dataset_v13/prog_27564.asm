; DESCRIPTION: Composite: Draws a blue rectangle at (326, 31) with width 45 and height 90 then Draws a red circle centered at (234, 190) with radius 61.
; PLAN: r0=326(x), r1=31(y), r2=45(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=190(y), r7=61(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 326
LDI r1, 31
LDI r2, 45
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 190
LDI r7, 61
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
