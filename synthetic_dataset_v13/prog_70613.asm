; DESCRIPTION: Places a yellow 57x41 rectangle at position (88, 69).
; PLAN: r0=88(x), r1=69(y), r2=57(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 69
LDI r2, 57
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
