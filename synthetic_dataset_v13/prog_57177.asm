; DESCRIPTION: Draws a black rectangle at (307, 15) with width 107 and height 76.
; PLAN: r0=307(x), r1=15(y), r2=107(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 15
LDI r2, 107
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
