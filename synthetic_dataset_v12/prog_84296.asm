; DESCRIPTION: Renders a purple box of size 64x83 starting at (56, 121).
; PLAN: r0=56(x), r1=121(y), r2=64(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 121
LDI r2, 64
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
