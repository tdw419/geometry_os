; DESCRIPTION: Places a orange 21x101 rectangle at position (2, 16).
; PLAN: r0=2(x), r1=16(y), r2=21(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 16
LDI r2, 21
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
