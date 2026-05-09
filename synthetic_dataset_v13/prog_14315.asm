; DESCRIPTION: Renders a blue box of size 19x26 starting at (53, 33).
; PLAN: r0=53(x), r1=33(y), r2=19(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 33
LDI r2, 19
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
