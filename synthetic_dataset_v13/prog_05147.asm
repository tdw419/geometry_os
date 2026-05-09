; DESCRIPTION: Renders a magenta box of size 19x97 starting at (316, 130).
; PLAN: r0=316(x), r1=130(y), r2=19(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 130
LDI r2, 19
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
