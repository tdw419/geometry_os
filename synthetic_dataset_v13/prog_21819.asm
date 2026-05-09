; DESCRIPTION: Renders a red box of size 68x101 starting at (192, 66).
; PLAN: r0=192(x), r1=66(y), r2=68(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 66
LDI r2, 68
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
