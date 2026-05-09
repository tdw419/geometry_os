; DESCRIPTION: Places a orange 38x32 rectangle at position (119, 100).
; PLAN: r0=119(x), r1=100(y), r2=38(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 100
LDI r2, 38
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
