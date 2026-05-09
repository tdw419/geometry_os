; DESCRIPTION: Places a white 62x41 rectangle at position (37, 95).
; PLAN: r0=37(x), r1=95(y), r2=62(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 95
LDI r2, 62
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
