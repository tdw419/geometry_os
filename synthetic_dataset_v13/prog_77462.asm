; DESCRIPTION: Renders a red box of size 13x83 starting at (343, 62).
; PLAN: r0=343(x), r1=62(y), r2=13(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 62
LDI r2, 13
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
