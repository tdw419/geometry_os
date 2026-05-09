; DESCRIPTION: Places a orange 58x94 rectangle at position (301, 56).
; PLAN: r0=301(x), r1=56(y), r2=58(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 56
LDI r2, 58
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
