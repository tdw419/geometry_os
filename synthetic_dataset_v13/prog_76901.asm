; DESCRIPTION: Places a orange 74x118 rectangle at position (363, 109).
; PLAN: r0=363(x), r1=109(y), r2=74(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 109
LDI r2, 74
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
