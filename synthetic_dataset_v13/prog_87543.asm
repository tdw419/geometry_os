; DESCRIPTION: Draws a black rectangle at (175, 109) with width 102 and height 30.
; PLAN: r0=175(x), r1=109(y), r2=102(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 109
LDI r2, 102
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
