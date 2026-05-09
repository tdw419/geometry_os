; DESCRIPTION: Places a orange 78x106 rectangle at position (94, 78).
; PLAN: r0=94(x), r1=78(y), r2=78(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 78
LDI r2, 78
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
