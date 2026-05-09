; DESCRIPTION: Renders a black box of size 68x84 starting at (110, 122).
; PLAN: r0=110(x), r1=122(y), r2=68(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 122
LDI r2, 68
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
