; DESCRIPTION: Draws a green rectangle at (203, 73) with width 24 and height 103.
; PLAN: r0=203(x), r1=73(y), r2=24(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 73
LDI r2, 24
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
