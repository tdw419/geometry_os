; DESCRIPTION: Renders a black box of size 58x53 starting at (437, 26).
; PLAN: r0=437(x), r1=26(y), r2=58(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 26
LDI r2, 58
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
