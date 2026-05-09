; DESCRIPTION: Renders a red box of size 18x19 starting at (122, 20).
; PLAN: r0=122(x), r1=20(y), r2=18(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 20
LDI r2, 18
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
