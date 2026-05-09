; DESCRIPTION: Renders a black box of size 76x44 starting at (34, 189).
; PLAN: r0=34(x), r1=189(y), r2=76(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 189
LDI r2, 76
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
