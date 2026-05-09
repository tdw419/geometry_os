; DESCRIPTION: Draws a orange rectangle at (213, 97) with width 116 and height 92.
; PLAN: r0=213(x), r1=97(y), r2=116(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 97
LDI r2, 116
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
