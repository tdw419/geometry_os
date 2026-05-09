; DESCRIPTION: Renders a black box of size 98x92 starting at (67, 138).
; PLAN: r0=67(x), r1=138(y), r2=98(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 138
LDI r2, 98
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
