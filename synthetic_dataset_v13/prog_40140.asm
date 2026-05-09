; DESCRIPTION: Composite: Draws a black rectangle at (37, 61) with width 19 and height 67 then Places a orange circle of radius 32 at center (176, 219).
; PLAN: r0=37(x), r1=61(y), r2=19(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x), r6=219(y), r7=32(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 37
LDI r1, 61
LDI r2, 19
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 219
LDI r7, 32
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
