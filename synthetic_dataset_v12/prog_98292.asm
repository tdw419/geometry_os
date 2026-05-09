; DESCRIPTION: Places a orange 32x22 rectangle at position (280, 128).
; PLAN: r0=280(x), r1=128(y), r2=32(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 128
LDI r2, 32
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
