; DESCRIPTION: Renders a red box of size 57x37 starting at (67, 101).
; PLAN: r0=67(x), r1=101(y), r2=57(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 101
LDI r2, 57
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
