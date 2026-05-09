; DESCRIPTION: Renders a black box of size 33x87 starting at (38, 53).
; PLAN: r0=38(x), r1=53(y), r2=33(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 53
LDI r2, 33
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
