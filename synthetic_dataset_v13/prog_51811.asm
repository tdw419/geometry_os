; DESCRIPTION: Draws a black rectangle at (32, 81) with width 112 and height 64.
; PLAN: r0=32(x), r1=81(y), r2=112(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 81
LDI r2, 112
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
