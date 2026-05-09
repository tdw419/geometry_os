; DESCRIPTION: Places a orange 81x110 rectangle at position (123, 128).
; PLAN: r0=123(x), r1=128(y), r2=81(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 128
LDI r2, 81
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
