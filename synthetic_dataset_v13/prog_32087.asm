; DESCRIPTION: Places a orange 77x87 rectangle at position (262, 56).
; PLAN: r0=262(x), r1=56(y), r2=77(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 56
LDI r2, 77
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
