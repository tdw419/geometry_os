; DESCRIPTION: Places a black 70x26 rectangle at position (430, 94).
; PLAN: r0=430(x), r1=94(y), r2=70(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 94
LDI r2, 70
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
