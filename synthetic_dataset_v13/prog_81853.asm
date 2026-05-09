; DESCRIPTION: Renders a black box of size 69x71 starting at (187, 26).
; PLAN: r0=187(x), r1=26(y), r2=69(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 26
LDI r2, 69
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
