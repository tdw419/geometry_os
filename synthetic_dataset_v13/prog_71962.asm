; DESCRIPTION: Draws a red rectangle at (221, 159) with width 114 and height 90.
; PLAN: r0=221(x), r1=159(y), r2=114(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 159
LDI r2, 114
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
