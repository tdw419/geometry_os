; DESCRIPTION: Places a black 117x68 rectangle at position (375, 80).
; PLAN: r0=375(x), r1=80(y), r2=117(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 80
LDI r2, 117
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
