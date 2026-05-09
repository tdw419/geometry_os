; DESCRIPTION: Renders a magenta box of size 34x14 starting at (318, 4).
; PLAN: r0=318(x), r1=4(y), r2=34(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 4
LDI r2, 34
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
