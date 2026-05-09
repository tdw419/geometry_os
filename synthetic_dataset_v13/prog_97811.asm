; DESCRIPTION: Composite: Draws a yellow rectangle at (462, 39) with width 35 and height 99 then Places a red dot at position (47, 87).
; PLAN: r0=462(x), r1=39(y), r2=35(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=47(x), r6=87(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 462
LDI r1, 39
LDI r2, 35
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 47
LDI r6, 87
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
