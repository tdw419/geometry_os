; DESCRIPTION: Renders a blue box of size 49x12 starting at (307, 218).
; PLAN: r0=307(x), r1=218(y), r2=49(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 218
LDI r2, 49
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
