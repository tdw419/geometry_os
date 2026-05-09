; DESCRIPTION: Renders a black box of size 67x116 starting at (34, 18).
; PLAN: r0=34(x), r1=18(y), r2=67(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 18
LDI r2, 67
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
