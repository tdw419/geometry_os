; DESCRIPTION: Renders a black box of size 22x37 starting at (477, 3).
; PLAN: r0=477(x), r1=3(y), r2=22(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 3
LDI r2, 22
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
