; DESCRIPTION: Places a orange 57x87 rectangle at position (329, 160).
; PLAN: r0=329(x), r1=160(y), r2=57(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 160
LDI r2, 57
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
