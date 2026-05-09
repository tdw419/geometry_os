; DESCRIPTION: Places a orange 118x80 rectangle at position (343, 130).
; PLAN: r0=343(x), r1=130(y), r2=118(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 130
LDI r2, 118
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
