; DESCRIPTION: Places a white 88x101 rectangle at position (234, 98).
; PLAN: r0=234(x), r1=98(y), r2=88(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 98
LDI r2, 88
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
