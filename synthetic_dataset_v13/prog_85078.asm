; DESCRIPTION: Places a cyan 41x94 rectangle at position (161, 11).
; PLAN: r0=161(x), r1=11(y), r2=41(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 11
LDI r2, 41
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
