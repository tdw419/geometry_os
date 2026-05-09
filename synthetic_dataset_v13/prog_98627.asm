; DESCRIPTION: Composite: Creates a blue rectangular region at (449, 107) spanning 43 by 113 pixels then Renders a blue disk with center (167, 99) and radius 55.
; PLAN: r0=449(x), r1=107(y), r2=43(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=167(x), r6=99(y), r7=55(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 449
LDI r1, 107
LDI r2, 43
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 99
LDI r7, 55
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
