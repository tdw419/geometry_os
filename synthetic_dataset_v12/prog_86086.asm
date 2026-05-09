; DESCRIPTION: Composite: Renders a white box of size 35x58 starting at (131, 44) then Places a black circle of radius 23 at center (176, 183).
; PLAN: r0=131(x), r1=44(y), r2=35(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x), r6=183(y), r7=23(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 131
LDI r1, 44
LDI r2, 35
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 183
LDI r7, 23
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
