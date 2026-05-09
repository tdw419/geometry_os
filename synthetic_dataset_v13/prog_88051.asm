; DESCRIPTION: Composite: Places a black dot at position (357, 47) then Draws a green rectangle at (414, 116) with width 51 and height 49.
; PLAN: r0=357(x), r1=47(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=414(x), r6=116(y), r7=51(width), r8=49(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 357
LDI r1, 47
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 414
LDI r6, 116
LDI r7, 51
LDI r8, 49
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
