; DESCRIPTION: Places a purple 41x26 rectangle at position (119, 51).
; PLAN: r0=119(x), r1=51(y), r2=41(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 51
LDI r2, 41
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
