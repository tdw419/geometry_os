; DESCRIPTION: Renders a blue box of size 36x13 starting at (288, 78).
; PLAN: r0=288(x), r1=78(y), r2=36(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 78
LDI r2, 36
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
