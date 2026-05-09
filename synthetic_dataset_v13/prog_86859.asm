; DESCRIPTION: Places a orange 52x106 rectangle at position (323, 123).
; PLAN: r0=323(x), r1=123(y), r2=52(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 123
LDI r2, 52
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
