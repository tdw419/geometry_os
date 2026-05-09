; DESCRIPTION: Places a orange 22x31 rectangle at position (343, 116).
; PLAN: r0=343(x), r1=116(y), r2=22(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 116
LDI r2, 22
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
