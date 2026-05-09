; DESCRIPTION: Places a cyan 41x89 rectangle at position (467, 73).
; PLAN: r0=467(x), r1=73(y), r2=41(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 73
LDI r2, 41
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
