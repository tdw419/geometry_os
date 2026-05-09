; DESCRIPTION: Renders a black box of size 45x62 starting at (412, 155).
; PLAN: r0=412(x), r1=155(y), r2=45(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 155
LDI r2, 45
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
