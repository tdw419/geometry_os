; DESCRIPTION: Composite: Places a magenta 18x70 rectangle at position (310, 147) then Draws a cyan circle centered at (293, 144) with radius 35.
; PLAN: r0=310(x), r1=147(y), r2=18(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=293(x), r6=144(y), r7=35(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 310
LDI r1, 147
LDI r2, 18
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 144
LDI r7, 35
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
