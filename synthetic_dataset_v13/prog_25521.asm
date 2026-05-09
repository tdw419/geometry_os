; DESCRIPTION: Composite: Places a cyan 105x16 rectangle at position (86, 217) then Draws a black circle centered at (464, 19) with radius 14.
; PLAN: r0=86(x), r1=217(y), r2=105(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=464(x), r6=19(y), r7=14(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 86
LDI r1, 217
LDI r2, 105
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 19
LDI r7, 14
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
