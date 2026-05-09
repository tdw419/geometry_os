; DESCRIPTION: Places a purple 41x78 rectangle at position (162, 142).
; PLAN: r0=162(x), r1=142(y), r2=41(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 142
LDI r2, 41
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
