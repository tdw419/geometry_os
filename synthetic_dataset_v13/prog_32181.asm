; DESCRIPTION: Places a orange 10x118 rectangle at position (246, 110).
; PLAN: r0=246(x), r1=110(y), r2=10(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 110
LDI r2, 10
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
