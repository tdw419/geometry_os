; DESCRIPTION: Places a green 41x93 rectangle at position (151, 159).
; PLAN: r0=151(x), r1=159(y), r2=41(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 159
LDI r2, 41
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
