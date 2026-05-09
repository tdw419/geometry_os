; DESCRIPTION: Draws a white rectangle at (76, 220) with width 101 and height 12.
; PLAN: r0=76(x), r1=220(y), r2=101(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 220
LDI r2, 101
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
