; DESCRIPTION: Places a red 87x70 rectangle at position (419, 87).
; PLAN: r0=419(x), r1=87(y), r2=87(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 87
LDI r2, 87
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
