; DESCRIPTION: Composite: Draws a purple rectangle at (234, 83) with width 60 and height 114 then Places a magenta dot at position (360, 250).
; PLAN: r0=234(x), r1=83(y), r2=60(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x), r6=250(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 234
LDI r1, 83
LDI r2, 60
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 250
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
