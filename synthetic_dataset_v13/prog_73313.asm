; DESCRIPTION: Places a white 79x41 rectangle at position (297, 27).
; PLAN: r0=297(x), r1=27(y), r2=79(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 27
LDI r2, 79
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
