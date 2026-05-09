; DESCRIPTION: Places a orange 118x25 rectangle at position (106, 81).
; PLAN: r0=106(x), r1=81(y), r2=118(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 81
LDI r2, 118
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
