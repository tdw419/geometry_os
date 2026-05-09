; DESCRIPTION: Draws a red rectangle at (413, 103) with width 62 and height 88.
; PLAN: r0=413(x), r1=103(y), r2=62(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 103
LDI r2, 62
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
