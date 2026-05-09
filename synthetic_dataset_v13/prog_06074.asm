; DESCRIPTION: Renders a blue box of size 23x43 starting at (114, 108).
; PLAN: r0=114(x), r1=108(y), r2=23(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 108
LDI r2, 23
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
