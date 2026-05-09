; DESCRIPTION: Places a orange 83x72 rectangle at position (329, 31).
; PLAN: r0=329(x), r1=31(y), r2=83(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 31
LDI r2, 83
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
