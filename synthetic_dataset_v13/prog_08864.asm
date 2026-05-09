; DESCRIPTION: Composite: Places a purple dot at position (352, 215) then Draws a red rectangle at (359, 159) with width 110 and height 43.
; PLAN: r0=352(x), r1=215(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=159(y), r7=110(width), r8=43(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 215
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 359
LDI r6, 159
LDI r7, 110
LDI r8, 43
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
