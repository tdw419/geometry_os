; DESCRIPTION: Composite: Places a white 102x114 rectangle at position (121, 93) then Sets a single red pixel at (431, 41) then Renders a white disk with center (341, 183) and radius 60.
; PLAN: r0=121(x), r1=93(y), r2=102(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=431(x), r6=41(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=341(x), r11=183(y), r12=60(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 121
LDI r1, 93
LDI r2, 102
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 41
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 341
LDI r11, 183
LDI r12, 60
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
