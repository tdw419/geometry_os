; DESCRIPTION: Places a cyan 93x41 rectangle at position (188, 119).
; PLAN: r0=188(x), r1=119(y), r2=93(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 119
LDI r2, 93
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
