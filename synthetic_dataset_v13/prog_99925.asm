; DESCRIPTION: Renders a red box of size 98x108 starting at (31, 73).
; PLAN: r0=31(x), r1=73(y), r2=98(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 73
LDI r2, 98
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
