; DESCRIPTION: Renders a purple box of size 64x102 starting at (47, 8).
; PLAN: r0=47(x), r1=8(y), r2=64(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 8
LDI r2, 64
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
