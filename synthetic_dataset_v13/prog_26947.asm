; DESCRIPTION: Places a orange 19x103 rectangle at position (71, 118).
; PLAN: r0=71(x), r1=118(y), r2=19(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 118
LDI r2, 19
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
