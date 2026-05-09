; DESCRIPTION: Renders a red box of size 18x19 starting at (261, 76).
; PLAN: r0=261(x), r1=76(y), r2=18(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 76
LDI r2, 18
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
