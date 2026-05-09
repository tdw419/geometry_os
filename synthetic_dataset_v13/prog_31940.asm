; DESCRIPTION: Composite: Places a purple dot at position (352, 171) then Draws a black rectangle at (14, 145) with width 49 and height 11.
; PLAN: r0=352(x), r1=171(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=14(x), r6=145(y), r7=49(width), r8=11(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 171
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 14
LDI r6, 145
LDI r7, 49
LDI r8, 11
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
