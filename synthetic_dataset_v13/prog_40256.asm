; DESCRIPTION: Renders a magenta box of size 40x62 starting at (4, 53).
; PLAN: r0=4(x), r1=53(y), r2=40(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 53
LDI r2, 40
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
