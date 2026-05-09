; DESCRIPTION: Composite: Places a white 107x44 rectangle at position (327, 203) then Creates a black circular shape at (411, 140) with radius 18.
; PLAN: r0=327(x), r1=203(y), r2=107(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=411(x), r6=140(y), r7=18(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 327
LDI r1, 203
LDI r2, 107
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 140
LDI r7, 18
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
