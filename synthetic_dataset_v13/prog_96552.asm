; DESCRIPTION: Renders a red box of size 84x117 starting at (67, 41).
; PLAN: r0=67(x), r1=41(y), r2=84(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 41
LDI r2, 84
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
