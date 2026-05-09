; DESCRIPTION: Renders a blue box of size 58x52 starting at (301, 110).
; PLAN: r0=301(x), r1=110(y), r2=58(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 110
LDI r2, 58
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
