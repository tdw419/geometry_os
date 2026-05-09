; DESCRIPTION: Composite: Places a black 119x118 rectangle at position (277, 76) then Renders a white disk with center (355, 145) and radius 67.
; PLAN: r0=277(x), r1=76(y), r2=119(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x), r6=145(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 277
LDI r1, 76
LDI r2, 119
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 145
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
