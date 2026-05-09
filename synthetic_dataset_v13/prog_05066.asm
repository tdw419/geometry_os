; DESCRIPTION: Renders a red box of size 62x101 starting at (144, 54).
; PLAN: r0=144(x), r1=54(y), r2=62(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 54
LDI r2, 62
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
