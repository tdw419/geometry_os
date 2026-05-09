; DESCRIPTION: Draws a white rectangle at (60, 88) with width 40 and height 64.
; PLAN: r0=60(x), r1=88(y), r2=40(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 88
LDI r2, 40
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
