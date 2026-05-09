; DESCRIPTION: Draws a black rectangle at (459, 20) with width 32 and height 96.
; PLAN: r0=459(x), r1=20(y), r2=32(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 20
LDI r2, 32
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
