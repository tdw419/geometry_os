; DESCRIPTION: Renders a black box of size 114x35 starting at (219, 120).
; PLAN: r0=219(x), r1=120(y), r2=114(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 120
LDI r2, 114
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
