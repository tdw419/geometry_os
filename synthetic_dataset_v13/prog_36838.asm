; DESCRIPTION: Draws a red rectangle at (356, 105) with width 82 and height 34.
; PLAN: r0=356(x), r1=105(y), r2=82(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 105
LDI r2, 82
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
