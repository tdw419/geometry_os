; DESCRIPTION: Draws a black rectangle at (61, 16) with width 112 and height 96.
; PLAN: r0=61(x), r1=16(y), r2=112(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 16
LDI r2, 112
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
