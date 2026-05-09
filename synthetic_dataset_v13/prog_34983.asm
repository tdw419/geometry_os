; DESCRIPTION: Places a green 71x41 rectangle at position (230, 35).
; PLAN: r0=230(x), r1=35(y), r2=71(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 35
LDI r2, 71
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
