; DESCRIPTION: Renders a black box of size 76x105 starting at (50, 66).
; PLAN: r0=50(x), r1=66(y), r2=76(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 66
LDI r2, 76
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
