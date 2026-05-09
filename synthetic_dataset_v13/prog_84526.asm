; DESCRIPTION: Composite: Places a black dot at position (475, 160) then Draws a blue rectangle at (112, 51) with width 57 and height 67.
; PLAN: r0=475(x), r1=160(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=51(y), r7=57(width), r8=67(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 475
LDI r1, 160
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 112
LDI r6, 51
LDI r7, 57
LDI r8, 67
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
