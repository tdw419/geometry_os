; DESCRIPTION: Places a orange 77x107 rectangle at position (376, 34).
; PLAN: r0=376(x), r1=34(y), r2=77(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 34
LDI r2, 77
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
