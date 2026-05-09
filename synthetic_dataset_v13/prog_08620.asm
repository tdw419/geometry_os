; DESCRIPTION: Places a orange 109x77 rectangle at position (323, 52).
; PLAN: r0=323(x), r1=52(y), r2=109(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 52
LDI r2, 109
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
