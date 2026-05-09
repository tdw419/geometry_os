; DESCRIPTION: Composite: Draws a yellow rectangle at (11, 71) with width 68 and height 96 then Places a purple dot at position (207, 109).
; PLAN: r0=11(x), r1=71(y), r2=68(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x), r6=109(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 11
LDI r1, 71
LDI r2, 68
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 109
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
