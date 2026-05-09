; DESCRIPTION: Places a red 52x101 rectangle at position (83, 68).
; PLAN: r0=83(x), r1=68(y), r2=52(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 68
LDI r2, 52
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
