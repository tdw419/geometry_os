; DESCRIPTION: Composite: Places a purple dot at position (469, 233) then Draws a green rectangle at (81, 96) with width 41 and height 119.
; PLAN: r0=469(x), r1=233(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=96(y), r7=41(width), r8=119(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 469
LDI r1, 233
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 81
LDI r6, 96
LDI r7, 41
LDI r8, 119
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
