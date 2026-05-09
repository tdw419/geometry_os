; DESCRIPTION: Places a orange 31x101 rectangle at position (392, 56).
; PLAN: r0=392(x), r1=56(y), r2=31(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 56
LDI r2, 31
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
