; DESCRIPTION: Renders a black box of size 15x26 starting at (324, 11).
; PLAN: r0=324(x), r1=11(y), r2=15(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 11
LDI r2, 15
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
