; DESCRIPTION: Renders a black box of size 13x108 starting at (133, 1).
; PLAN: r0=133(x), r1=1(y), r2=13(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 1
LDI r2, 13
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
