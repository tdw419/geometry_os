; DESCRIPTION: Composite: Places a purple 120x113 rectangle at position (204, 86) then Creates a white circular shape at (199, 86) with radius 70.
; PLAN: r0=204(x), r1=86(y), r2=120(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=86(y), r7=70(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 204
LDI r1, 86
LDI r2, 120
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 86
LDI r7, 70
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
