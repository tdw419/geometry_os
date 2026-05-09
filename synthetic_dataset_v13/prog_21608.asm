; DESCRIPTION: Places a orange 119x73 rectangle at position (231, 32).
; PLAN: r0=231(x), r1=32(y), r2=119(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 32
LDI r2, 119
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
