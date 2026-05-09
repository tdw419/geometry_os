; DESCRIPTION: Renders a purple box of size 13x53 starting at (326, 43).
; PLAN: r0=326(x), r1=43(y), r2=13(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 43
LDI r2, 13
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
