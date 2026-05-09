; DESCRIPTION: Draws a black rectangle at (327, 112) with width 64 and height 20.
; PLAN: r0=327(x), r1=112(y), r2=64(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 112
LDI r2, 64
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
