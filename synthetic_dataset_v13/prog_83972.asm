; DESCRIPTION: Renders a black box of size 76x110 starting at (86, 35).
; PLAN: r0=86(x), r1=35(y), r2=76(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 35
LDI r2, 76
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
