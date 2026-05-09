; DESCRIPTION: Places a orange 117x68 rectangle at position (155, 89).
; PLAN: r0=155(x), r1=89(y), r2=117(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 89
LDI r2, 117
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
