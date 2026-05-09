; DESCRIPTION: Places a orange 83x70 rectangle at position (83, 11).
; PLAN: r0=83(x), r1=11(y), r2=83(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 11
LDI r2, 83
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
