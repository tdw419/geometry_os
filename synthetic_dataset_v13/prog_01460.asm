; DESCRIPTION: Renders a red box of size 84x41 starting at (62, 198).
; PLAN: r0=62(x), r1=198(y), r2=84(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 198
LDI r2, 84
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
