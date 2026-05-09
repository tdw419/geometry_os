; DESCRIPTION: Draws a white rectangle at (237, 156) with width 74 and height 32.
; PLAN: r0=237(x), r1=156(y), r2=74(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 156
LDI r2, 74
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
