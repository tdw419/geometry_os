; DESCRIPTION: Renders a black box of size 67x23 starting at (76, 119).
; PLAN: r0=76(x), r1=119(y), r2=67(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 119
LDI r2, 67
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
