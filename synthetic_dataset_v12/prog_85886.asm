; DESCRIPTION: Renders a purple box of size 32x30 starting at (158, 175).
; PLAN: r0=158(x), r1=175(y), r2=32(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 175
LDI r2, 32
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
