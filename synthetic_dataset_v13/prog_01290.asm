; DESCRIPTION: Draws a black rectangle at (100, 196) with width 86 and height 26.
; PLAN: r0=100(x), r1=196(y), r2=86(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 196
LDI r2, 86
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
