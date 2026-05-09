; DESCRIPTION: Places a green 41x75 rectangle at position (14, 4).
; PLAN: r0=14(x), r1=4(y), r2=41(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 4
LDI r2, 41
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
