; DESCRIPTION: Places a orange 81x76 rectangle at position (254, 59).
; PLAN: r0=254(x), r1=59(y), r2=81(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 59
LDI r2, 81
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
