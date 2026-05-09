; DESCRIPTION: Places a orange 81x68 rectangle at position (81, 128).
; PLAN: r0=81(x), r1=128(y), r2=81(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 128
LDI r2, 81
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
