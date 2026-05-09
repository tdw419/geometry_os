; DESCRIPTION: Places a orange 18x15 rectangle at position (483, 57).
; PLAN: r0=483(x), r1=57(y), r2=18(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 57
LDI r2, 18
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
