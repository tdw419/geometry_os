; DESCRIPTION: Places a blue 118x41 rectangle at position (272, 52).
; PLAN: r0=272(x), r1=52(y), r2=118(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 52
LDI r2, 118
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
