; DESCRIPTION: Places a orange 41x73 rectangle at position (377, 142).
; PLAN: r0=377(x), r1=142(y), r2=41(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 142
LDI r2, 41
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
