; DESCRIPTION: Draws a black rectangle at (372, 34) with width 35 and height 102.
; PLAN: r0=372(x), r1=34(y), r2=35(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 34
LDI r2, 35
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
