; DESCRIPTION: Draws a white rectangle at (141, 54) with width 56 and height 64.
; PLAN: r0=141(x), r1=54(y), r2=56(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 54
LDI r2, 56
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
