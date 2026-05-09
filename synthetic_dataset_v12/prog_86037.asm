; DESCRIPTION: Renders a black box of size 67x40 starting at (18, 194).
; PLAN: r0=18(x), r1=194(y), r2=67(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 194
LDI r2, 67
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
