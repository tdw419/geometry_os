; DESCRIPTION: Draws a white rectangle at (442, 128) with width 30 and height 99.
; PLAN: r0=442(x), r1=128(y), r2=30(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 128
LDI r2, 30
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
