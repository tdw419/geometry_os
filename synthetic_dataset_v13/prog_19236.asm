; DESCRIPTION: Draws a white rectangle at (256, 144) with width 96 and height 64.
; PLAN: r0=256(x), r1=144(y), r2=96(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 144
LDI r2, 96
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
