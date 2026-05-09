; DESCRIPTION: Renders a black box of size 20x68 starting at (49, 15).
; PLAN: r0=49(x), r1=15(y), r2=20(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 15
LDI r2, 20
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
