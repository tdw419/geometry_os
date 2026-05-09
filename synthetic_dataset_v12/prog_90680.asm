; DESCRIPTION: Composite: Renders a purple box of size 24x108 starting at (329, 114) then Creates a blue circular shape at (451, 126) with radius 60.
; PLAN: r0=329(x), r1=114(y), r2=24(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=451(x), r6=126(y), r7=60(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 329
LDI r1, 114
LDI r2, 24
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 126
LDI r7, 60
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
