; DESCRIPTION: Draws a yellow rectangle at (383, 19) with width 28 and height 107.
; PLAN: r0=383(x), r1=19(y), r2=28(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 19
LDI r2, 28
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
