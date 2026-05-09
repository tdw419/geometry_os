; DESCRIPTION: Draws a black rectangle at (146, 56) with width 43 and height 74.
; PLAN: r0=146(x), r1=56(y), r2=43(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 56
LDI r2, 43
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
