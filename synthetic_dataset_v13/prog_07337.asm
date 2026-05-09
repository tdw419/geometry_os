; DESCRIPTION: Renders a black box of size 11x26 starting at (75, 40).
; PLAN: r0=75(x), r1=40(y), r2=11(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 40
LDI r2, 11
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
