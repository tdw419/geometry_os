; DESCRIPTION: Draws a yellow rectangle at (397, 196) with width 58 and height 12.
; PLAN: r0=397(x), r1=196(y), r2=58(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 196
LDI r2, 58
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
