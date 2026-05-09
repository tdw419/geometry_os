; DESCRIPTION: Places a purple 41x26 rectangle at position (388, 189).
; PLAN: r0=388(x), r1=189(y), r2=41(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 189
LDI r2, 41
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
