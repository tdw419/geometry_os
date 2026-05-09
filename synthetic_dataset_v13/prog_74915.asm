; DESCRIPTION: Composite: Places a magenta dot at position (500, 233) then Draws a orange rectangle at (477, 202) with width 19 and height 49.
; PLAN: r0=500(x), r1=233(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=477(x), r6=202(y), r7=19(width), r8=49(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 500
LDI r1, 233
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 477
LDI r6, 202
LDI r7, 19
LDI r8, 49
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
