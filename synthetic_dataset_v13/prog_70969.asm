; DESCRIPTION: Places a white 41x24 rectangle at position (9, 93).
; PLAN: r0=9(x), r1=93(y), r2=41(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 93
LDI r2, 41
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
