; DESCRIPTION: Draws a red rectangle at (53, 142) with width 96 and height 97.
; PLAN: r0=53(x), r1=142(y), r2=96(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 142
LDI r2, 96
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
