; DESCRIPTION: Draws a white rectangle at (85, 130) with width 64 and height 89.
; PLAN: r0=85(x), r1=130(y), r2=64(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 130
LDI r2, 64
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
