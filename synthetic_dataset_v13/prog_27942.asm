; DESCRIPTION: Places a cyan 41x79 rectangle at position (196, 93).
; PLAN: r0=196(x), r1=93(y), r2=41(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 93
LDI r2, 41
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
