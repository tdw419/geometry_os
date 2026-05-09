; DESCRIPTION: Renders a magenta box of size 88x101 starting at (244, 40).
; PLAN: r0=244(x), r1=40(y), r2=88(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 40
LDI r2, 88
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
