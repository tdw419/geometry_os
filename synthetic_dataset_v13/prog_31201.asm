; DESCRIPTION: Draws a black rectangle at (50, 121) with width 71 and height 40.
; PLAN: r0=50(x), r1=121(y), r2=71(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 121
LDI r2, 71
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
