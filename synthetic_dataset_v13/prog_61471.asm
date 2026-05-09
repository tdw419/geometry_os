; DESCRIPTION: Renders a blue box of size 32x102 starting at (231, 49).
; PLAN: r0=231(x), r1=49(y), r2=32(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 49
LDI r2, 32
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
