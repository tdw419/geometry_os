; DESCRIPTION: Places a orange 86x114 rectangle at position (355, 86).
; PLAN: r0=355(x), r1=86(y), r2=86(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 86
LDI r2, 86
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
