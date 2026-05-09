; DESCRIPTION: Renders a black box of size 45x91 starting at (119, 77).
; PLAN: r0=119(x), r1=77(y), r2=45(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 77
LDI r2, 45
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
