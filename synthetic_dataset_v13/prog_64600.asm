; DESCRIPTION: Draws a white rectangle at (356, 101) with width 38 and height 39.
; PLAN: r0=356(x), r1=101(y), r2=38(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 101
LDI r2, 38
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
