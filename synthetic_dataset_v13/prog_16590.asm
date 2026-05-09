; DESCRIPTION: Composite: Places a black dot at position (67, 199) then Draws a yellow rectangle at (341, 127) with width 52 and height 57.
; PLAN: r0=67(x), r1=199(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=127(y), r7=52(width), r8=57(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 199
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 341
LDI r6, 127
LDI r7, 52
LDI r8, 57
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
