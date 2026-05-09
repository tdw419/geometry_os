; DESCRIPTION: Renders a black box of size 65x13 starting at (66, 110).
; PLAN: r0=66(x), r1=110(y), r2=65(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 110
LDI r2, 65
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
