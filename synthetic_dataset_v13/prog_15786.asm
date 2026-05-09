; DESCRIPTION: Places a orange 37x12 rectangle at position (337, 36).
; PLAN: r0=337(x), r1=36(y), r2=37(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 36
LDI r2, 37
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
