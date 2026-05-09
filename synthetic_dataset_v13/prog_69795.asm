; DESCRIPTION: Composite: Places a cyan 66x43 rectangle at position (243, 49) then Draws a black circle centered at (461, 72) with radius 23.
; PLAN: r0=243(x), r1=49(y), r2=66(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=461(x), r6=72(y), r7=23(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 243
LDI r1, 49
LDI r2, 66
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 72
LDI r7, 23
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
