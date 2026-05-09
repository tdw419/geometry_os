; DESCRIPTION: Places a cyan 41x74 rectangle at position (1, 79).
; PLAN: r0=1(x), r1=79(y), r2=41(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 79
LDI r2, 41
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
