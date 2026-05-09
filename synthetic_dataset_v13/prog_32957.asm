; DESCRIPTION: Composite: Renders a black disk with center (142, 178) and radius 58 then Places a blue 65x39 rectangle at position (339, 195).
; PLAN: r0=142(x), r1=178(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=339(x), r6=195(y), r7=65(width), r8=39(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 178
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 339
LDI r6, 195
LDI r7, 65
LDI r8, 39
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
