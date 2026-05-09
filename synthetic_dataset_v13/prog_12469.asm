; DESCRIPTION: Composite: Draws a magenta rectangle at (135, 50) with width 108 and height 77 then Places a green circle of radius 78 at center (334, 132).
; PLAN: r0=135(x), r1=50(y), r2=108(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=334(x), r6=132(y), r7=78(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 135
LDI r1, 50
LDI r2, 108
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 132
LDI r7, 78
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
