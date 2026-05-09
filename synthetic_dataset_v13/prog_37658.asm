; DESCRIPTION: Places a orange 99x81 rectangle at position (149, 163).
; PLAN: r0=149(x), r1=163(y), r2=99(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 163
LDI r2, 99
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
