; DESCRIPTION: Renders a red box of size 64x19 starting at (407, 95).
; PLAN: r0=407(x), r1=95(y), r2=64(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 95
LDI r2, 64
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
