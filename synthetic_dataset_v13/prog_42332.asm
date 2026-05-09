; DESCRIPTION: Draws a black rectangle at (183, 107) with width 23 and height 49.
; PLAN: r0=183(x), r1=107(y), r2=23(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 107
LDI r2, 23
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
