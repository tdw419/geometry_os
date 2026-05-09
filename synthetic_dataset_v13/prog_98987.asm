; DESCRIPTION: Renders a red box of size 29x106 starting at (348, 143).
; PLAN: r0=348(x), r1=143(y), r2=29(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 143
LDI r2, 29
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
