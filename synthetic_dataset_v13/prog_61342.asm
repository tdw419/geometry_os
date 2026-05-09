; DESCRIPTION: Composite: Places a blue 51x29 rectangle at position (427, 72) then Draws a green circle centered at (234, 108) with radius 42.
; PLAN: r0=427(x), r1=72(y), r2=51(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=108(y), r7=42(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 427
LDI r1, 72
LDI r2, 51
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 108
LDI r7, 42
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
