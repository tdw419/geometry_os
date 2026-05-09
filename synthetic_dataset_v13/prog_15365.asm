; DESCRIPTION: Renders a magenta box of size 97x18 starting at (88, 39).
; PLAN: r0=88(x), r1=39(y), r2=97(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 39
LDI r2, 97
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
