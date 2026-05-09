; DESCRIPTION: Draws a black rectangle at (102, 200) with width 24 and height 14.
; PLAN: r0=102(x), r1=200(y), r2=24(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 200
LDI r2, 24
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
