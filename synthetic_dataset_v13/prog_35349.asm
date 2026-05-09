; DESCRIPTION: Places a white 23x41 rectangle at position (377, 0).
; PLAN: r0=377(x), r1=0(y), r2=23(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 0
LDI r2, 23
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
