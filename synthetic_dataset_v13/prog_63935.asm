; DESCRIPTION: Places a orange 12x31 rectangle at position (118, 189).
; PLAN: r0=118(x), r1=189(y), r2=12(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 189
LDI r2, 12
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
