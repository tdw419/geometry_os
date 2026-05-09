; DESCRIPTION: Composite: Draws a blue rectangle at (383, 119) with width 71 and height 114 then Places a green dot at position (503, 183).
; PLAN: r0=383(x), r1=119(y), r2=71(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=503(x), r6=183(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 383
LDI r1, 119
LDI r2, 71
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 503
LDI r6, 183
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
