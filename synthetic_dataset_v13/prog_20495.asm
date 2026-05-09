; DESCRIPTION: Renders a red box of size 18x28 starting at (381, 96).
; PLAN: r0=381(x), r1=96(y), r2=18(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 96
LDI r2, 18
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
