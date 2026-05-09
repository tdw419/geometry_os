; DESCRIPTION: Renders a purple box of size 28x36 starting at (326, 49).
; PLAN: r0=326(x), r1=49(y), r2=28(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 49
LDI r2, 28
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
