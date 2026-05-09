; DESCRIPTION: Places a orange 81x49 rectangle at position (262, 72).
; PLAN: r0=262(x), r1=72(y), r2=81(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 72
LDI r2, 81
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
