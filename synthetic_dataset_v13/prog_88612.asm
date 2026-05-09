; DESCRIPTION: Draws a yellow rectangle at (19, 165) with width 30 and height 60.
; PLAN: r0=19(x), r1=165(y), r2=30(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 165
LDI r2, 30
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
