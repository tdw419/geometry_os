; DESCRIPTION: Composite: Draws a blue circle centered at (411, 125) with radius 64 then Creates a black rectangular region at (19, 113) spanning 94 by 70 pixels.
; PLAN: r0=411(x), r1=125(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=19(x), r6=113(y), r7=94(width), r8=70(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 411
LDI r1, 125
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 19
LDI r6, 113
LDI r7, 94
LDI r8, 70
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
