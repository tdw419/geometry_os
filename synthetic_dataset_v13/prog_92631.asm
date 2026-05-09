; DESCRIPTION: Renders a black box of size 110x83 starting at (11, 13).
; PLAN: r0=11(x), r1=13(y), r2=110(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 13
LDI r2, 110
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
