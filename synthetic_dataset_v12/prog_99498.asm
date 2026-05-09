; DESCRIPTION: Renders a black box of size 114x18 starting at (299, 110).
; PLAN: r0=299(x), r1=110(y), r2=114(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 110
LDI r2, 114
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
