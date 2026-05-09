; DESCRIPTION: Places a orange 28x23 rectangle at position (316, 77).
; PLAN: r0=316(x), r1=77(y), r2=28(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 77
LDI r2, 28
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
