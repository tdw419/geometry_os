; DESCRIPTION: Places a orange 76x91 rectangle at position (390, 128).
; PLAN: r0=390(x), r1=128(y), r2=76(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 128
LDI r2, 76
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
