; DESCRIPTION: Composite: Places a yellow 72x73 rectangle at position (97, 170) then Draws a blue circle centered at (329, 69) with radius 50.
; PLAN: r0=97(x), r1=170(y), r2=72(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x), r6=69(y), r7=50(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 97
LDI r1, 170
LDI r2, 72
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 69
LDI r7, 50
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
