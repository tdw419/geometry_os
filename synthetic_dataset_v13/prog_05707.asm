; DESCRIPTION: Renders a red box of size 17x39 starting at (28, 190).
; PLAN: r0=28(x), r1=190(y), r2=17(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 190
LDI r2, 17
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
