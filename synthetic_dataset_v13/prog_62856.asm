; DESCRIPTION: Composite: Draws a white rectangle at (187, 52) with width 114 and height 53 then Sets a single black pixel at (441, 96).
; PLAN: r0=187(x), r1=52(y), r2=114(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=441(x), r6=96(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 187
LDI r1, 52
LDI r2, 114
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 96
LDI r7, 0x000000
PSET r5, r6, r7
HALT
