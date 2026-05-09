; DESCRIPTION: Composite: Creates a black circular shape at (126, 30) with radius 26 then Places a black dot at position (397, 19) then Places a green 22x12 rectangle at position (137, 40).
; PLAN: r0=126(x), r1=30(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x), r6=19(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=137(x), r11=40(y), r12=22(width), r13=12(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 126
LDI r1, 30
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 19
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 137
LDI r11, 40
LDI r12, 22
LDI r13, 12
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
