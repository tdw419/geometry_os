; DESCRIPTION: Places a orange 23x47 rectangle at position (94, 172).
; PLAN: r0=94(x), r1=172(y), r2=23(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 172
LDI r2, 23
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
