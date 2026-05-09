; DESCRIPTION: Draws a white rectangle at (278, 64) with width 29 and height 14.
; PLAN: r0=278(x), r1=64(y), r2=29(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 64
LDI r2, 29
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
