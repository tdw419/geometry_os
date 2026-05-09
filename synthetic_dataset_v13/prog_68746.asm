; DESCRIPTION: Places a white 43x87 rectangle at position (238, 41).
; PLAN: r0=238(x), r1=41(y), r2=43(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 41
LDI r2, 43
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
