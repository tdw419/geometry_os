; DESCRIPTION: Draws a red rectangle at (204, 151) with width 92 and height 15.
; PLAN: r0=204(x), r1=151(y), r2=92(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 151
LDI r2, 92
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
