; DESCRIPTION: Renders a blue box of size 78x110 starting at (176, 62).
; PLAN: r0=176(x), r1=62(y), r2=78(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 62
LDI r2, 78
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
