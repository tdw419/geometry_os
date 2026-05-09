; DESCRIPTION: Renders a purple box of size 64x81 starting at (383, 102).
; PLAN: r0=383(x), r1=102(y), r2=64(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 102
LDI r2, 64
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
