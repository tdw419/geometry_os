; DESCRIPTION: Places a orange 71x61 rectangle at position (100, 56).
; PLAN: r0=100(x), r1=56(y), r2=71(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 56
LDI r2, 71
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
