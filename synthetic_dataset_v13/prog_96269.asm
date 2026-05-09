; DESCRIPTION: Draws a black rectangle at (320, 176) with width 76 and height 75.
; PLAN: r0=320(x), r1=176(y), r2=76(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 176
LDI r2, 76
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
