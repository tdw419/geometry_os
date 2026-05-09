; DESCRIPTION: Places a white 57x41 rectangle at position (238, 36).
; PLAN: r0=238(x), r1=36(y), r2=57(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 36
LDI r2, 57
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
