; DESCRIPTION: Renders a red box of size 86x99 starting at (399, 53).
; PLAN: r0=399(x), r1=53(y), r2=86(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 53
LDI r2, 86
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
