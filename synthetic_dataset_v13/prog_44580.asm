; DESCRIPTION: Draws a black rectangle at (409, 157) with width 71 and height 49.
; PLAN: r0=409(x), r1=157(y), r2=71(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 157
LDI r2, 71
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
