; DESCRIPTION: Places a orange 119x47 rectangle at position (131, 37).
; PLAN: r0=131(x), r1=37(y), r2=119(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 37
LDI r2, 119
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
