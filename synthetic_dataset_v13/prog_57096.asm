; DESCRIPTION: Composite: Places a purple dot at position (383, 183) then Draws a cyan rectangle at (397, 68) with width 93 and height 17.
; PLAN: r0=383(x), r1=183(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=397(x), r6=68(y), r7=93(width), r8=17(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 383
LDI r1, 183
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 397
LDI r6, 68
LDI r7, 93
LDI r8, 17
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
