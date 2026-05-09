; DESCRIPTION: Composite: Places a purple dot at position (473, 248) then Draws a red rectangle at (173, 4) with width 35 and height 51.
; PLAN: r0=473(x), r1=248(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=173(x), r6=4(y), r7=35(width), r8=51(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 473
LDI r1, 248
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 173
LDI r6, 4
LDI r7, 35
LDI r8, 51
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
