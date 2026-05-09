; DESCRIPTION: Places a cyan 114x41 rectangle at position (109, 75).
; PLAN: r0=109(x), r1=75(y), r2=114(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 75
LDI r2, 114
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
