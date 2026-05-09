; DESCRIPTION: Renders a red box of size 93x101 starting at (254, 64).
; PLAN: r0=254(x), r1=64(y), r2=93(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 64
LDI r2, 93
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
