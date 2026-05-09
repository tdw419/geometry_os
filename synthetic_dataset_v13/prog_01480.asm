; DESCRIPTION: Renders a red box of size 30x28 starting at (244, 81).
; PLAN: r0=244(x), r1=81(y), r2=30(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 81
LDI r2, 30
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
