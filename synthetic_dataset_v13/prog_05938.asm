; DESCRIPTION: Renders a red box of size 108x38 starting at (47, 190).
; PLAN: r0=47(x), r1=190(y), r2=108(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 190
LDI r2, 108
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
