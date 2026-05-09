; DESCRIPTION: Renders a red box of size 15x82 starting at (26, 43).
; PLAN: r0=26(x), r1=43(y), r2=15(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 43
LDI r2, 15
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
