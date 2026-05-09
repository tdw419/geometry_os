; DESCRIPTION: Renders a red box of size 66x76 starting at (84, 99).
; PLAN: r0=84(x), r1=99(y), r2=66(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 99
LDI r2, 66
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
