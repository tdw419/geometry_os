; DESCRIPTION: Places a orange 16x101 rectangle at position (56, 7).
; PLAN: r0=56(x), r1=7(y), r2=16(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 7
LDI r2, 16
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
