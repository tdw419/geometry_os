; DESCRIPTION: Draws a black rectangle at (64, 77) with width 44 and height 113.
; PLAN: r0=64(x), r1=77(y), r2=44(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 77
LDI r2, 44
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
