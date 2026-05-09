; DESCRIPTION: Renders a red box of size 69x43 starting at (427, 45).
; PLAN: r0=427(x), r1=45(y), r2=69(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 45
LDI r2, 69
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
