; DESCRIPTION: Composite: Places a yellow 111x98 rectangle at position (151, 90) then Draws a blue circle centered at (247, 165) with radius 70.
; PLAN: r0=151(x), r1=90(y), r2=111(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=247(x), r6=165(y), r7=70(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 151
LDI r1, 90
LDI r2, 111
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 165
LDI r7, 70
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
