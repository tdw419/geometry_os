; DESCRIPTION: Composite: Places a orange 53x14 rectangle at position (215, 185) then Places a purple circle of radius 43 at center (74, 209).
; PLAN: r0=215(x), r1=185(y), r2=53(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x), r6=209(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 215
LDI r1, 185
LDI r2, 53
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 209
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
