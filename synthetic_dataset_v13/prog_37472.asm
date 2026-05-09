; DESCRIPTION: Places a orange 78x12 rectangle at position (427, 128).
; PLAN: r0=427(x), r1=128(y), r2=78(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 128
LDI r2, 78
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
