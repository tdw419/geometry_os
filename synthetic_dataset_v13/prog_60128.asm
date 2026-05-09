; DESCRIPTION: Renders a red box of size 22x82 starting at (348, 149).
; PLAN: r0=348(x), r1=149(y), r2=22(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 149
LDI r2, 22
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
