; DESCRIPTION: Places a white 58x41 rectangle at position (98, 51).
; PLAN: r0=98(x), r1=51(y), r2=58(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 51
LDI r2, 58
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
