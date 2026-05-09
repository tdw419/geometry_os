; DESCRIPTION: Composite: Draws a magenta rectangle at (72, 120) with width 39 and height 90 then Draws a blue circle centered at (218, 64) with radius 45.
; PLAN: r0=72(x), r1=120(y), r2=39(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x), r6=64(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 72
LDI r1, 120
LDI r2, 39
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 64
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
