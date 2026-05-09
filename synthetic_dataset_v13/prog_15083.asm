; DESCRIPTION: Renders a red box of size 14x66 starting at (190, 43).
; PLAN: r0=190(x), r1=43(y), r2=14(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 43
LDI r2, 14
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
