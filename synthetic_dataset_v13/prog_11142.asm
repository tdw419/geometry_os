; DESCRIPTION: Renders a purple box of size 49x29 starting at (371, 189).
; PLAN: r0=371(x), r1=189(y), r2=49(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 189
LDI r2, 49
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
