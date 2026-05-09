; DESCRIPTION: Draws a black rectangle at (69, 39) with width 30 and height 40.
; PLAN: r0=69(x), r1=39(y), r2=30(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 39
LDI r2, 30
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
