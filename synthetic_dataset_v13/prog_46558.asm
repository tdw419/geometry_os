; DESCRIPTION: Composite: Renders a blue box of size 23x76 starting at (71, 101) then Places a blue circle of radius 13 at center (143, 188).
; PLAN: r0=71(x), r1=101(y), r2=23(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x), r6=188(y), r7=13(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 71
LDI r1, 101
LDI r2, 23
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 188
LDI r7, 13
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
