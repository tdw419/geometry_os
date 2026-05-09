; DESCRIPTION: Renders a magenta box of size 33x49 starting at (149, 122).
; PLAN: r0=149(x), r1=122(y), r2=33(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 122
LDI r2, 33
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
