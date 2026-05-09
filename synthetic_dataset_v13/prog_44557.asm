; DESCRIPTION: Draws a yellow rectangle at (310, 72) with width 60 and height 32.
; PLAN: r0=310(x), r1=72(y), r2=60(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 72
LDI r2, 60
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
