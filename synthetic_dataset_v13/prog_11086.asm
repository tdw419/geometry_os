; DESCRIPTION: Places a white 41x55 rectangle at position (329, 195).
; PLAN: r0=329(x), r1=195(y), r2=41(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 195
LDI r2, 41
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
