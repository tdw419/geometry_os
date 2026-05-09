; DESCRIPTION: Renders a red box of size 23x98 starting at (10, 18).
; PLAN: r0=10(x), r1=18(y), r2=23(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 18
LDI r2, 23
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
