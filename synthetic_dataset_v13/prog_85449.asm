; DESCRIPTION: Composite: Places a black circle of radius 53 at center (208, 69) then Renders a white box of size 25x82 starting at (326, 76) then Places a black dot at position (101, 212).
; PLAN: r0=208(x), r1=69(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x), r6=76(y), r7=25(width), r8=82(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=101(x), r11=212(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 208
LDI r1, 69
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 76
LDI r7, 25
LDI r8, 82
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 212
LDI r12, 0x000000
PSET r10, r11, r12
HALT
