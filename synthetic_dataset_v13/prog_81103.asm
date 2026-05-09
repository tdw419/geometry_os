; DESCRIPTION: Places a purple 118x41 rectangle at position (178, 139).
; PLAN: r0=178(x), r1=139(y), r2=118(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 139
LDI r2, 118
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
