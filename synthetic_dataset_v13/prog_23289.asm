; DESCRIPTION: Places a white 107x41 rectangle at position (80, 103).
; PLAN: r0=80(x), r1=103(y), r2=107(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 103
LDI r2, 107
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
