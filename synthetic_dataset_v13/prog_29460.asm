; DESCRIPTION: Draws a black rectangle at (105, 196) with width 53 and height 20.
; PLAN: r0=105(x), r1=196(y), r2=53(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 196
LDI r2, 53
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
