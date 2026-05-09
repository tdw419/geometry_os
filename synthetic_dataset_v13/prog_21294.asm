; DESCRIPTION: Renders a red box of size 67x17 starting at (8, 78).
; PLAN: r0=8(x), r1=78(y), r2=67(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 78
LDI r2, 67
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
