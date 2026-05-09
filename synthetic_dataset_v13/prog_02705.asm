; DESCRIPTION: Composite: Places a white 102x29 rectangle at position (391, 103) then Renders a black disk with center (446, 105) and radius 15.
; PLAN: r0=391(x), r1=103(y), r2=102(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=105(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 391
LDI r1, 103
LDI r2, 102
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 105
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
