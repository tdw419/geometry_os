; DESCRIPTION: Renders a magenta box of size 114x78 starting at (90, 170).
; PLAN: r0=90(x), r1=170(y), r2=114(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 170
LDI r2, 114
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
