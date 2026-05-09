; DESCRIPTION: Renders a blue box of size 49x45 starting at (178, 123).
; PLAN: r0=178(x), r1=123(y), r2=49(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 123
LDI r2, 49
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
