; DESCRIPTION: Composite: Places a orange dot at position (426, 15) then Renders a blue box of size 77x51 starting at (74, 61).
; PLAN: r0=426(x), r1=15(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=74(x), r6=61(y), r7=77(width), r8=51(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 15
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 74
LDI r6, 61
LDI r7, 77
LDI r8, 51
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
