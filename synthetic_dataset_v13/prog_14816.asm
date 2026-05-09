; DESCRIPTION: Composite: Renders a purple disk with center (131, 134) and radius 24 then Renders a blue box of size 81x23 starting at (319, 3).
; PLAN: r0=131(x), r1=134(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=319(x), r6=3(y), r7=81(width), r8=23(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 134
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 319
LDI r6, 3
LDI r7, 81
LDI r8, 23
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
