; DESCRIPTION: Composite: Places a black 111x97 rectangle at position (240, 14) then Creates a red circular shape at (402, 188) with radius 43.
; PLAN: r0=240(x), r1=14(y), r2=111(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=188(y), r7=43(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 240
LDI r1, 14
LDI r2, 111
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 188
LDI r7, 43
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
