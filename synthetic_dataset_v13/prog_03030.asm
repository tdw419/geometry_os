; DESCRIPTION: Renders a red box of size 10x11 starting at (73, 90).
; PLAN: r0=73(x), r1=90(y), r2=10(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 90
LDI r2, 10
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
