; DESCRIPTION: Renders a blue box of size 81x64 starting at (210, 39).
; PLAN: r0=210(x), r1=39(y), r2=81(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 39
LDI r2, 81
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
