; DESCRIPTION: Places a orange 28x89 rectangle at position (419, 114).
; PLAN: r0=419(x), r1=114(y), r2=28(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 114
LDI r2, 28
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
