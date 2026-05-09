; DESCRIPTION: Draws a green rectangle at (128, 148) with width 18 and height 79.
; PLAN: r0=128(x), r1=148(y), r2=18(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 148
LDI r2, 18
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
