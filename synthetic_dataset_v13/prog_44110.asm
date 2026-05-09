; DESCRIPTION: Composite: Places a black 116x75 rectangle at position (39, 105) then Places a green circle of radius 31 at center (354, 67).
; PLAN: r0=39(x), r1=105(y), r2=116(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=354(x), r6=67(y), r7=31(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 39
LDI r1, 105
LDI r2, 116
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 67
LDI r7, 31
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
