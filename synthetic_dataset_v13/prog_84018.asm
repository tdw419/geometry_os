; DESCRIPTION: Composite: Places a black 19x58 rectangle at position (372, 60) then Places a blue circle of radius 10 at center (173, 61).
; PLAN: r0=372(x), r1=60(y), r2=19(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=173(x), r6=61(y), r7=10(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 372
LDI r1, 60
LDI r2, 19
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 61
LDI r7, 10
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
