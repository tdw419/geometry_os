; DESCRIPTION: Renders a black box of size 13x15 starting at (201, 85).
; PLAN: r0=201(x), r1=85(y), r2=13(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 85
LDI r2, 13
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
