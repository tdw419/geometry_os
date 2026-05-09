; DESCRIPTION: Places a orange 107x57 rectangle at position (94, 35).
; PLAN: r0=94(x), r1=35(y), r2=107(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 35
LDI r2, 107
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
