; DESCRIPTION: Composite: Draws a black rectangle at (138, 76) with width 106 and height 103 then Sets a single red pixel at (361, 174).
; PLAN: r0=138(x), r1=76(y), r2=106(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=361(x), r6=174(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 138
LDI r1, 76
LDI r2, 106
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 174
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
