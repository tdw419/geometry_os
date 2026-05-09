; DESCRIPTION: Places a orange 14x60 rectangle at position (467, 3).
; PLAN: r0=467(x), r1=3(y), r2=14(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 3
LDI r2, 14
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
