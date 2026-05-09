; DESCRIPTION: Composite: Places a black dot at position (254, 69) then Draws a magenta rectangle at (77, 37) with width 101 and height 10.
; PLAN: r0=254(x), r1=69(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=77(x), r6=37(y), r7=101(width), r8=10(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 69
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 77
LDI r6, 37
LDI r7, 101
LDI r8, 10
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
