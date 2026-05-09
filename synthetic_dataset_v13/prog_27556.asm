; DESCRIPTION: Places a orange 117x68 rectangle at position (359, 45).
; PLAN: r0=359(x), r1=45(y), r2=117(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 45
LDI r2, 117
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
