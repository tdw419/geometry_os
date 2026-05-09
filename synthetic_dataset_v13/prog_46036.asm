; DESCRIPTION: Composite: Draws a red rectangle at (376, 50) with width 29 and height 65 then Places a orange dot at position (424, 249).
; PLAN: r0=376(x), r1=50(y), r2=29(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x), r6=249(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 376
LDI r1, 50
LDI r2, 29
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 249
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
