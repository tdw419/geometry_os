; DESCRIPTION: Composite: Places a black dot at position (430, 30) then Draws a orange rectangle at (19, 103) with width 44 and height 53.
; PLAN: r0=430(x), r1=30(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=19(x), r6=103(y), r7=44(width), r8=53(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 30
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 19
LDI r6, 103
LDI r7, 44
LDI r8, 53
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
