; DESCRIPTION: Renders a black box of size 11x107 starting at (67, 38).
; PLAN: r0=67(x), r1=38(y), r2=11(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 38
LDI r2, 11
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
