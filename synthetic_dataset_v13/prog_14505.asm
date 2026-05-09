; DESCRIPTION: Draws a red rectangle at (355, 175) with width 67 and height 17.
; PLAN: r0=355(x), r1=175(y), r2=67(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 175
LDI r2, 67
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
