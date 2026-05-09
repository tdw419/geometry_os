; DESCRIPTION: Composite: Places a yellow 67x10 rectangle at position (206, 67) then Places a black circle of radius 72 at center (390, 183).
; PLAN: r0=206(x), r1=67(y), r2=67(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=390(x), r6=183(y), r7=72(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 206
LDI r1, 67
LDI r2, 67
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 183
LDI r7, 72
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
