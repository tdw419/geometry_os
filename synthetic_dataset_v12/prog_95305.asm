; DESCRIPTION: Renders a red box of size 35x100 starting at (259, 66).
; PLAN: r0=259(x), r1=66(y), r2=35(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 66
LDI r2, 35
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
