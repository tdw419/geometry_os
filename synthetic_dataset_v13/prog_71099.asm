; DESCRIPTION: Renders a blue box of size 49x18 starting at (221, 64).
; PLAN: r0=221(x), r1=64(y), r2=49(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 64
LDI r2, 49
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
