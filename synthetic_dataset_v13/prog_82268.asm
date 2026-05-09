; DESCRIPTION: Renders a black box of size 109x20 starting at (348, 135).
; PLAN: r0=348(x), r1=135(y), r2=109(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 135
LDI r2, 109
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
