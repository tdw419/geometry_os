; DESCRIPTION: Renders a magenta box of size 53x67 starting at (140, 105).
; PLAN: r0=140(x), r1=105(y), r2=53(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 105
LDI r2, 53
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
