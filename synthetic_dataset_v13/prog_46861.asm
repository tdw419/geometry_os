; DESCRIPTION: Draws a red rectangle at (217, 148) with width 62 and height 99.
; PLAN: r0=217(x), r1=148(y), r2=62(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 148
LDI r2, 62
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
