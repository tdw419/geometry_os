; DESCRIPTION: Renders a red box of size 13x43 starting at (31, 11).
; PLAN: r0=31(x), r1=11(y), r2=13(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 11
LDI r2, 13
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
