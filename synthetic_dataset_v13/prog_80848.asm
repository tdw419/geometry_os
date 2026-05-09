; DESCRIPTION: Places a orange 49x108 rectangle at position (117, 94).
; PLAN: r0=117(x), r1=94(y), r2=49(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 94
LDI r2, 49
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
