; DESCRIPTION: Renders a red box of size 115x10 starting at (101, 190).
; PLAN: r0=101(x), r1=190(y), r2=115(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 190
LDI r2, 115
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
