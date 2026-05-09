; DESCRIPTION: Places a purple 41x82 rectangle at position (46, 161).
; PLAN: r0=46(x), r1=161(y), r2=41(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 161
LDI r2, 41
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
