; DESCRIPTION: Places a orange 73x81 rectangle at position (234, 25).
; PLAN: r0=234(x), r1=25(y), r2=73(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 25
LDI r2, 73
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
