; DESCRIPTION: Renders a black box of size 117x15 starting at (97, 35).
; PLAN: r0=97(x), r1=35(y), r2=117(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 35
LDI r2, 117
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
