; DESCRIPTION: Draws a black rectangle at (420, 165) with width 36 and height 73.
; PLAN: r0=420(x), r1=165(y), r2=36(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 165
LDI r2, 36
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
