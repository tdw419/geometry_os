; DESCRIPTION: Composite: Places a black dot at position (99, 175) then Draws a blue rectangle at (138, 103) with width 44 and height 53.
; PLAN: r0=99(x), r1=175(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=138(x), r6=103(y), r7=44(width), r8=53(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 99
LDI r1, 175
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 138
LDI r6, 103
LDI r7, 44
LDI r8, 53
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
