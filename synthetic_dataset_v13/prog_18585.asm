; DESCRIPTION: Renders a purple box of size 64x24 starting at (257, 202).
; PLAN: r0=257(x), r1=202(y), r2=64(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 202
LDI r2, 64
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
