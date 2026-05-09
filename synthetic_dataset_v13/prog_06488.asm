; DESCRIPTION: Draws a black rectangle at (86, 164) with width 112 and height 28.
; PLAN: r0=86(x), r1=164(y), r2=112(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 164
LDI r2, 112
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
