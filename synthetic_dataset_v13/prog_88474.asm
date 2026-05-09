; DESCRIPTION: Draws a red rectangle at (265, 97) with width 113 and height 44.
; PLAN: r0=265(x), r1=97(y), r2=113(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 97
LDI r2, 113
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
