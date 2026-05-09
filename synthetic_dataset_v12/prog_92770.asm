; DESCRIPTION: Composite: Draws a magenta rectangle at (386, 46) with width 119 and height 96 then Places a purple dot at position (129, 117).
; PLAN: r0=386(x), r1=46(y), r2=119(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=117(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 386
LDI r1, 46
LDI r2, 119
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 117
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
