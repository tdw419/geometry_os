; DESCRIPTION: Composite: Places a black 94x78 rectangle at position (4, 98) then Places a black circle of radius 55 at center (194, 100).
; PLAN: r0=4(x), r1=98(y), r2=94(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x), r6=100(y), r7=55(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 4
LDI r1, 98
LDI r2, 94
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 100
LDI r7, 55
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
