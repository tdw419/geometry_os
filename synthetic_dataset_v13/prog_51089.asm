; DESCRIPTION: Renders a black box of size 53x22 starting at (206, 165).
; PLAN: r0=206(x), r1=165(y), r2=53(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 165
LDI r2, 53
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
