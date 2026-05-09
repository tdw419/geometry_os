; DESCRIPTION: Renders a white box of size 74x78 starting at (28, 36).
; PLAN: r0=28(x), r1=36(y), r2=74(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 36
LDI r2, 74
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
