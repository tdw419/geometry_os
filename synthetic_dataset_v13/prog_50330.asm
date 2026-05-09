; DESCRIPTION: Renders a black box of size 97x83 starting at (333, 99).
; PLAN: r0=333(x), r1=99(y), r2=97(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 99
LDI r2, 97
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
