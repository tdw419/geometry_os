; DESCRIPTION: Draws a black rectangle at (253, 157) with width 76 and height 86.
; PLAN: r0=253(x), r1=157(y), r2=76(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 157
LDI r2, 76
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
