; DESCRIPTION: Renders a purple box of size 15x32 starting at (371, 114).
; PLAN: r0=371(x), r1=114(y), r2=15(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 114
LDI r2, 15
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
