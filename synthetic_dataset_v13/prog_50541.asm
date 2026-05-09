; DESCRIPTION: Draws a red rectangle at (269, 157) with width 105 and height 81.
; PLAN: r0=269(x), r1=157(y), r2=105(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 157
LDI r2, 105
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
