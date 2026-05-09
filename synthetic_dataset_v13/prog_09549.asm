; DESCRIPTION: Draws a black rectangle at (335, 60) with width 102 and height 69.
; PLAN: r0=335(x), r1=60(y), r2=102(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 60
LDI r2, 102
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
