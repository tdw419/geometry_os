; DESCRIPTION: Draws a green rectangle at (263, 175) with width 81 and height 64.
; PLAN: r0=263(x), r1=175(y), r2=81(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 175
LDI r2, 81
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
