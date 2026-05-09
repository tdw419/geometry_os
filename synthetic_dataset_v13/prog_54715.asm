; DESCRIPTION: Places a white 48x41 rectangle at position (343, 79).
; PLAN: r0=343(x), r1=79(y), r2=48(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 79
LDI r2, 48
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
