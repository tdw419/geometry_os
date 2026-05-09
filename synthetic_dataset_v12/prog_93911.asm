; DESCRIPTION: Composite: Draws a red rectangle at (73, 75) with width 103 and height 12 then Places a black dot at position (1, 237).
; PLAN: r0=73(x), r1=75(y), r2=103(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x), r6=237(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 73
LDI r1, 75
LDI r2, 103
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 237
LDI r7, 0x000000
PSET r5, r6, r7
HALT
