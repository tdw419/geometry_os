; DESCRIPTION: Composite: Draws a blue rectangle at (241, 51) with width 39 and height 104 then Places a purple dot at position (258, 0).
; PLAN: r0=241(x), r1=51(y), r2=39(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x), r6=0(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 241
LDI r1, 51
LDI r2, 39
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 0
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
