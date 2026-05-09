; DESCRIPTION: Places a orange 78x110 rectangle at position (375, 82).
; PLAN: r0=375(x), r1=82(y), r2=78(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 82
LDI r2, 78
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
