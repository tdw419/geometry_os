; DESCRIPTION: Places a white 41x30 rectangle at position (1, 186).
; PLAN: r0=1(x), r1=186(y), r2=41(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 186
LDI r2, 41
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
