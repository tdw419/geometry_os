; DESCRIPTION: Renders a blue box of size 71x14 starting at (388, 32).
; PLAN: r0=388(x), r1=32(y), r2=71(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 32
LDI r2, 71
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
