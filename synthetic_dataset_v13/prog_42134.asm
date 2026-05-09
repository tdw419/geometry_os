; DESCRIPTION: Draws a green rectangle at (375, 109) with width 80 and height 96.
; PLAN: r0=375(x), r1=109(y), r2=80(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 109
LDI r2, 80
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
