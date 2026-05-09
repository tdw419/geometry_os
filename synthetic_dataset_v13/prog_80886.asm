; DESCRIPTION: Renders a magenta box of size 69x111 starting at (430, 97).
; PLAN: r0=430(x), r1=97(y), r2=69(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 97
LDI r2, 69
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
