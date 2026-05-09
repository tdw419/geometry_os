; DESCRIPTION: Places a orange 62x103 rectangle at position (356, 12).
; PLAN: r0=356(x), r1=12(y), r2=62(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 12
LDI r2, 62
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
