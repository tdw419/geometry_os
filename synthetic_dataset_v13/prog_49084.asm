; DESCRIPTION: Places a purple 73x15 rectangle at position (41, 139).
; PLAN: r0=41(x), r1=139(y), r2=73(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 139
LDI r2, 73
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
