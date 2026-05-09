; DESCRIPTION: Draws a white rectangle at (239, 128) with width 28 and height 79.
; PLAN: r0=239(x), r1=128(y), r2=28(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 128
LDI r2, 28
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
