; DESCRIPTION: Draws a black rectangle at (377, 221) with width 17 and height 12.
; PLAN: r0=377(x), r1=221(y), r2=17(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 221
LDI r2, 17
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
