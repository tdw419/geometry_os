; DESCRIPTION: Places a red 52x47 rectangle at position (231, 205).
; PLAN: r0=231(x), r1=205(y), r2=52(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 205
LDI r2, 52
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
