; DESCRIPTION: Renders a blue box of size 21x38 starting at (483, 62).
; PLAN: r0=483(x), r1=62(y), r2=21(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 62
LDI r2, 21
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
