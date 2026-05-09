; DESCRIPTION: Draws a yellow rectangle at (397, 68) with width 53 and height 17.
; PLAN: r0=397(x), r1=68(y), r2=53(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 68
LDI r2, 53
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
