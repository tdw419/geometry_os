; DESCRIPTION: Draws a red rectangle at (11, 175) with width 74 and height 72.
; PLAN: r0=11(x), r1=175(y), r2=74(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 175
LDI r2, 74
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
