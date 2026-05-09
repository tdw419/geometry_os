; DESCRIPTION: Places a orange 77x72 rectangle at position (407, 139).
; PLAN: r0=407(x), r1=139(y), r2=77(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 139
LDI r2, 77
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
