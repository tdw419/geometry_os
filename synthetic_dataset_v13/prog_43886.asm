; DESCRIPTION: Renders a black box of size 65x35 starting at (402, 116).
; PLAN: r0=402(x), r1=116(y), r2=65(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 116
LDI r2, 65
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
