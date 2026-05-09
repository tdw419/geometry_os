; DESCRIPTION: Renders a purple box of size 39x30 starting at (257, 210).
; PLAN: r0=257(x), r1=210(y), r2=39(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 210
LDI r2, 39
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
