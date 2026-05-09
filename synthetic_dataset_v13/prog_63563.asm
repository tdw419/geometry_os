; DESCRIPTION: Draws a black rectangle at (354, 139) with width 11 and height 51.
; PLAN: r0=354(x), r1=139(y), r2=11(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 139
LDI r2, 11
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
