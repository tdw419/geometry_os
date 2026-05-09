; DESCRIPTION: Composite: Draws a black rectangle at (278, 31) with width 61 and height 99 then Places a blue dot at position (175, 9).
; PLAN: r0=278(x), r1=31(y), r2=61(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x), r6=9(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 278
LDI r1, 31
LDI r2, 61
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 9
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
