; DESCRIPTION: Renders a red box of size 53x107 starting at (181, 122).
; PLAN: r0=181(x), r1=122(y), r2=53(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 122
LDI r2, 53
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
