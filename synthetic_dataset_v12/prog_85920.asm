; DESCRIPTION: Draws a white rectangle at (356, 101) with width 62 and height 103.
; PLAN: r0=356(x), r1=101(y), r2=62(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 101
LDI r2, 62
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
