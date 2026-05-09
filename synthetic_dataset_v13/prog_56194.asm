; DESCRIPTION: Renders a purple box of size 53x67 starting at (19, 105).
; PLAN: r0=19(x), r1=105(y), r2=53(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 105
LDI r2, 53
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
