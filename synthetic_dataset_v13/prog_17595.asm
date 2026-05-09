; DESCRIPTION: Draws a black rectangle at (154, 158) with width 81 and height 21.
; PLAN: r0=154(x), r1=158(y), r2=81(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 158
LDI r2, 81
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
