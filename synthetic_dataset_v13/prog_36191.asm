; DESCRIPTION: Composite: Places a black dot at position (81, 76) then Draws a orange rectangle at (350, 38) with width 101 and height 67.
; PLAN: r0=81(x), r1=76(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=350(x), r6=38(y), r7=101(width), r8=67(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 76
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 350
LDI r6, 38
LDI r7, 101
LDI r8, 67
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
