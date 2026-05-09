; DESCRIPTION: Renders a red box of size 34x25 starting at (477, 27).
; PLAN: r0=477(x), r1=27(y), r2=34(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 27
LDI r2, 34
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
