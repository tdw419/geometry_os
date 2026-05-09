; DESCRIPTION: Draws a red rectangle at (413, 227) with width 14 and height 28.
; PLAN: r0=413(x), r1=227(y), r2=14(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 227
LDI r2, 14
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
